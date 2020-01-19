let certificateTemplate = """
[
    $publicKey: {publicKey}
    $algorithms: [
        $digest: "SHA512"
        $signature: "ED25519"
    ]
](
    $type: /bali/notary/Certificate/v1
    $tag: {tag}
    $version: {version}
    $permissions: /bali/permissions/public/v1
    $previous: none
)
"""

public class Certificate : Content {
    public let publicKey: [UInt8]
    public let tag = formatter.generateTag()
    public let version = "v1"

    public init(publicKey: [UInt8]) {
        self.publicKey = publicKey
    }

    public func format(level: Int = 0) -> String {
        let publicKeyString = "'\(formatter.base32Encode(bytes: publicKey))'"
        var formatted = certificateTemplate.replacingOccurrences(of: "{publicKey}", with: publicKeyString)
        formatted = formatted.replacingOccurrences(of: "{tag}", with: tag)
        formatted = formatted.replacingOccurrences(of: "{version}", with: version)
        return formatter.indentLines(string: formatted, level: level)
    }

}


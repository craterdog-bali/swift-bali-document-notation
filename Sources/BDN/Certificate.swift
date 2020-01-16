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
    public let publicKey: String
    public let tag = formatter.generateTag()
    public let version = "v1"

    public init(publicKey: String) {
        self.publicKey = publicKey
    }

    public func format(level: Int = 0) -> String {
        var certificate = certificateTemplate.replacingOccurrences(of: "{publicKey}", with: publicKey)
        certificate = certificate.replacingOccurrences(of: "{tag}", with: tag)
        certificate = certificate.replacingOccurrences(of: "{version}", with: version)
        return formatter.indentLines(string: certificate, level: level)
    }

}


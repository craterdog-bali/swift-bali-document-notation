let citationTemplate = """
[
    $protocol: v2
    $tag: {tag}
    $version: {version}
    $digest: '{digest}
    '
]($type: /bali/notary/Citation/v1)
"""

public class Citation {
    public let tag: String
    public let version: String
    public let digest: [UInt8]

    public init(tag: String, version: String, digest: [UInt8]) {
        self.tag = tag
        self.version = version
        self.digest = digest
    }

    public func format(level: Int = 0) -> String {
        var digestString = formatter.formatLines(string: formatter.base32Encode(bytes: digest))
        digestString = formatter.indentLines(string: digestString, level: 2)
        var formatted = citationTemplate.replacingOccurrences(of: "{tag}", with: tag)
        formatted = formatted.replacingOccurrences(of: "{version}", with: version)
        formatted = formatted.replacingOccurrences(of: "{digest}", with: digestString)
        return formatter.indentLines(string: formatted, level: level)
    }

}


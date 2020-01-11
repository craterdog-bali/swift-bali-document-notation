let citationTemplate = """
[
    $protocol: v2
    $timestamp: {timestamp}
    $tag: {tag}
    $version: {version}
    $digest: '{digest}
    '
]($type: /bali/notary/Citation/v1)
"""

public class Citation {
    public let timestamp = formatter.currentTimestamp()
    public let tag: String
    public let version: String
    public let digest: String

    public init(tag: String, version: String, digest: String) {
        self.tag = tag
        self.version = version
        self.digest = digest
    }

    public func format(level: Int) -> String {
        var citation = citationTemplate.replacingOccurrences(of: "{timestamp}", with: timestamp)
        citation = citation.replacingOccurrences(of: "{tag}", with: tag)
        citation = citation.replacingOccurrences(of: "{version}", with: version)
        citation = citation.replacingOccurrences(of: "{digest}", with: formatter.indentLines(string: digest, level: 2))
        return formatter.indentLines(string: citation, level: level)
    }

}


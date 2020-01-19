let documentTemplate = """
[
    $protocol: v2
    $timestamp: {timestamp}
    $account: {account}
    $content: {content}
    $certificate: {certificate}
]($type: /bali/notary/Document/v1)
"""

let signedTemplate = """
[
    $protocol: v2
    $timestamp: {timestamp}
    $account: {account}
    $content: {content}
    $certificate: {certificate}
    $signature: '{signature}
    '
]($type: /bali/notary/Document/v1)
"""

public class Document {
    public let timestamp = formatter.currentTimestamp()
    public let account: String
    public let content: Content
    public let certificate: Citation?
    public let signature: [UInt8]?

    public init(account: String, content: Content, certificate: Citation? = nil, signature: [UInt8]? = nil) {
        self.account = account
        self.content = content
        self.certificate = certificate
        self.signature = signature
    }

    public func format(level: Int = 0) -> String {
        var formatted: String
        if signature != nil {
            var signatureString = formatter.formatLines(string: formatter.base32Encode(bytes: signature!))
            signatureString = formatter.indentLines(string: signatureString, level: 2)
            formatted = signedTemplate.replacingOccurrences(of: "{timestamp}", with: timestamp)
            formatted = formatted.replacingOccurrences(of: "{signature}", with: signatureString)
        } else {
            formatted = documentTemplate.replacingOccurrences(of: "{timestamp}", with: timestamp)
        }
        formatted = formatted.replacingOccurrences(of: "{account}", with: account)
        formatted = formatted.replacingOccurrences(of: "{content}", with: content.format(level: level + 1))
        if certificate != nil {
            formatted = formatted.replacingOccurrences(of: "{certificate}", with: certificate!.format(level: level + 1))
        } else {
            formatted = formatted.replacingOccurrences(of: "{certificate}", with: "none")
        }
        return formatter.indentLines(string: formatted, level: level)
    }

}

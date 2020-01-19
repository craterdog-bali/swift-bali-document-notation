let credentialsTemplate = """
[
    $salt: {salt}
](
    $type: /bali/notary/Credentials/v1
    $tag: {tag}
    $version: {version}
    $permissions: /bali/permissions/private/v1
    $previous: none
)
"""

public class Credentials : Content {
    public let salt = formatter.generateTag()
    public let tag = formatter.generateTag()
    public let version = "v1"

    public init() {
    }

    public func format(level: Int = 0) -> String {
        var formatted = credentialsTemplate.replacingOccurrences(of: "{salt}", with: salt)
        formatted = formatted.replacingOccurrences(of: "{tag}", with: tag)
        formatted = formatted.replacingOccurrences(of: "{version}", with: version)
        return formatter.indentLines(string: formatted, level: level)
    }

}


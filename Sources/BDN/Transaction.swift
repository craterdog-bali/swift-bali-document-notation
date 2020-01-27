import Foundation

let transactionTemplate = """
[
    $transaction: "{transaction}"
    $merchant: "{merchant}"
    $amount: "{amount}"
](
    $type: /bali/examples/Transaction/v1
    $tag: {tag}
    $version: {version}
    $permissions: /bali/permissions/public/v1
    $previous: none
)
"""

public class Transaction : Content {
    public let transaction: String
    public let merchant: String
    public let amount: String
    public let tag = formatter.generateTag()
    public let version = "v1"

    public init(merchant: String, amount: String) {
        self.transaction = String(tag.prefix(9).suffix(8))
        self.merchant = merchant
        self.amount = amount
    }

    public func format(level: Int = 0) -> String {
        var formatted = transactionTemplate.replacingOccurrences(of: "{transaction}", with: transaction)
        formatted = formatted.replacingOccurrences(of: "{merchant}", with: merchant)
        formatted = formatted.replacingOccurrences(of: "{amount}", with: amount)
        formatted = formatted.replacingOccurrences(of: "{tag}", with: tag)
        formatted = formatted.replacingOccurrences(of: "{version}", with: version)
        return formatter.indentLines(string: formatted, level: level)
    }

}


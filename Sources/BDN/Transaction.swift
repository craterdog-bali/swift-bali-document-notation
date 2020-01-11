let transactionTemplate = """
[
    $transaction: {transaction}
    $date: "{date}"
    $time: "{time}"
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
    public let transaction = formatter.generateTag()
    public let date = formatter.currentDate()
    public let time = formatter.currentTime()
    public let merchant: String
    public let amount: String
    public let tag = formatter.generateTag()
    public let version = "v1"

    public init(merchant: String, amount: String) {
        self.merchant = merchant
        self.amount = amount
    }

    public func format(level: Int) -> String {
        var transaction = transactionTemplate.replacingOccurrences(of: "{transaction}", with: self.transaction)
        transaction = transaction.replacingOccurrences(of: "{date}", with: date)
        transaction = transaction.replacingOccurrences(of: "{time}", with: time)
        transaction = transaction.replacingOccurrences(of: "{merchant}", with: merchant)
        transaction = transaction.replacingOccurrences(of: "{amount}", with: amount)
        transaction = transaction.replacingOccurrences(of: "{tag}", with: tag)
        transaction = transaction.replacingOccurrences(of: "{version}", with: version)
        return formatter.indentLines(string: transaction, level: level)
    }

}


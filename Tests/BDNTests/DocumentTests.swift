import XCTest
@testable import BDN

final class DocumentTests: XCTestCase {
    
    func testDocuments() {
        // generate a new account tag and public key
        let account = formatter.generateTag()
        let publicKey = formatter.generateKey()

        // create a new certificate
        let certificate = Certificate(publicKey: publicKey)
        var document = Document(account: account, content: certificate)

        // pretend to sign the certificate document
        var signature = formatter.generateSignature()
        document.signature = signature

        print("certificate: \(document.format())")
        print()

        // pretend to create a digest of the signed certificate document
        let digest = formatter.generateDigest()

        // generate a certificate citation
        let tag = certificate.tag
        let version = certificate.version
        let citation = Citation(tag: tag, version: version, digest: digest)

        print("citation: \(citation.format())")
        print()

        // create new credentials
        let credentials = Credentials()
        document = Document(account: account, content: credentials, certificate: citation)

        // pretend to sign the credentials document
        signature = formatter.generateSignature()
        document.signature = signature

        print("credentials: \(document.format())")
        print()

        // create a new transaction
        let merchant = "Starbucks"
        let amount = "$4.95"
        let transaction = Transaction(merchant: merchant, amount: amount)
        document = Document(account: account, content: transaction, certificate: citation)

        // pretend to sign the certificate document
        signature = formatter.generateSignature()
        document.signature = signature

        print("transaction: \(document.format())")
        print()
    }
}

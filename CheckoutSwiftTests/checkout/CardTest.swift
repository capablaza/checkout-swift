import XCTest
@testable import CheckoutSwift

class CardTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testShouldReturn30WhenIsCreditCardAndAmountIs1000() throws {
        let card = CreditCard(tax: 0.03)
        let amount:Float = 1000
        let expected:Float = 30
        let taxes = card.taxes(amount: amount)
        
        XCTAssertEqual(expected, taxes)
    }
    
    func testShouldReturnZeroWithCreditCardAndAmountIsZero() throws {
        let card = CreditCard(tax: 0.03)
        let amount:Float = 0
        let expected:Float = 0
        let taxes = card.taxes(amount: amount)
        
        XCTAssertEqual(expected, taxes)
    }
    
    func testShouldReturnZeroWhenCreditCardTaxIsZero() throws {
        let card = CreditCard(tax: 0)
        let amount:Float = 1000
        let expected:Float = 0
        let taxes = card.taxes(amount: amount)
        
        XCTAssertEqual(expected, taxes)
    }
    
    func testShouldReturn15WhenIsDebitCardAndAmountIs1000() throws {
        let card = DebitCard(tax: 0.015 )
        let amount:Float = 1000
        let expected:Float = 15
        let taxes = card.taxes(amount: amount)
        
        XCTAssertEqual(expected, taxes)
    }
    
    func testShouldReturnZeroWithDebitCardAndAmountIsZero() throws {
        let card = DebitCard(tax: 0.015 )
        let amount:Float = 0
        let expected:Float = 0
        let taxes = card.taxes(amount: amount)
        
        XCTAssertEqual(expected, taxes)
    }
    
    func testShouldReturnZeroWhenDebitCardTaxIsZero() throws {
        let card = DebitCard(tax: 0 )
        let amount:Float = 1000
        let expected:Float = 0
        let taxes = card.taxes(amount: amount)
        
        XCTAssertEqual(expected, taxes)
    }
    
    
    
}

import XCTest
@testable import CheckoutSwift

class CheckoutTest: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testGivenProductListWhenThisIsEmptyThenResponseIs504() throws {
        
        let service = CheckoutService()
        
        let products:[Product] = []
        
        let api = ApiPaymentStub()
        let card = CreditCard(tax: 0.03)
        
        let response = service.checkout(products: products, card: card, api: api)
        
        XCTAssertEqual(ApiStatus.AMOUNT_INVALID.rawValue, response.code);
    }
    
    func testGivenProductListWhenCreditCardTaxIsZeroThenResponseIs504() throws {
        
        let service = CheckoutService()
        
        let products:[Product] = []
        
        let api = ApiPaymentStub()
        let card = CreditCard(tax: 0)
        
        let response = service.checkout(products: products, card: card, api: api)
        
        XCTAssertEqual(ApiStatus.AMOUNT_INVALID.rawValue, response.code);
    }
    
    func testGivenProductListWhenThisIsCorrectButOutOfMoneyThenResponseIs503() throws {
        
        let service = CheckoutService()
        
        let products:[Product] = []
        
        let api = ApiPaymentValidationStub(code: ApiStatus.OUT_OF_MONEY.rawValue)
        let card = CreditCard(tax: 0.03)
        
        let response = service.checkout(products: products, card: card, api: api)
        
        XCTAssertEqual(ApiStatus.OUT_OF_MONEY.rawValue, response.code);
        
    }
    
    func testGivenProductListWhenThisIsCorrectButCardNotValidThenResponseIs502() throws {
        
        let service = CheckoutService()
        
        let products:[Product] = []
        
        let api = ApiPaymentValidationStub(code: ApiStatus.CARD_NOT_VALID.rawValue)
        let card = CreditCard(tax: 0.03)
        
        let response = service.checkout(products: products, card: card, api: api)
        
        XCTAssertEqual(ApiStatus.CARD_NOT_VALID.rawValue, response.code);
        
    }
    
    func testShouldReturnSuccessWhenCheckoutIsOk() throws {
        
        let service = CheckoutService()
        
        var products:[Product] = []
        
        products.append(Product(sku: "LK89232", amount: 500))
        products.append(Product(sku: "LK89843", amount: 500))
        
        let api = ApiPaymentStub()
        let card = CreditCard(tax: 0.03)
        
        let response = service.checkout(products: products, card: card, api: api)
        
        XCTAssertEqual(ApiStatus.SUCCESS.rawValue, response.code);
        
    }
    
    
}

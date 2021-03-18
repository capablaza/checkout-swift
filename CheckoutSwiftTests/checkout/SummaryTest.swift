import XCTest
@testable import CheckoutSwift

class SummaryTest: XCTestCase {
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testGivenTwoProductsWhenBothAvail500ThenBalanceIs1000() throws {
        
        var products: [Product] = []
        
        products.append(Product(sku: "LK89232", amount: 500))
        products.append(Product(sku: "LK89843", amount: 500))
        
        let expected:Float = 1000
        let summary  = Summary()
        let balance = summary.balance(products: products)
        
        XCTAssertEqual(expected, balance)
        
    }
    
    func testShouldReturnZeroWhenListProductIsEmpty() throws {
        let products: [Product] = []
        
        let expected:Float = 0
        let summary  = Summary()
        let balance = summary.balance(products: products)
        
        XCTAssertTrue(products.isEmpty)
        XCTAssertEqual(expected, balance)
        
    }
    
    func testShouldReturnZeroWhenBothsProductsHaveValueIdenticalButOpposite() throws {
        var products: [Product] = []
        products.append(Product(sku: "LK89232", amount: -500))
        products.append(Product(sku: "LK89843", amount: 500))

        let expected:Float = 0
        let summary  = Summary()
        let balance = summary.balance(products: products)
        XCTAssertEqual(expected, balance)
        
    }
    
    func testGivenProductValueIs500WhenProductValueIsNegativeThenReturnBalanceNegative() throws {
        var products: [Product] = []
        products.append(Product(sku: "LK89232", amount: -1500))
        products.append(Product(sku: "LK89843", amount: 500))

        let expected:Float = -1000
        let summary  = Summary()
        let balance = summary.balance(products: products)
        XCTAssertEqual(expected, balance)
        
    }
    
}

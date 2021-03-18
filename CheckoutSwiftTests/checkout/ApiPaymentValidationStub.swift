import Foundation
@testable import CheckoutSwift

class ApiPaymentValidationStub : ApiPayment {
    
    var code:Int
    
    init(code:Int) {
        self.code = code
    }
    
    func transfer(amount: Float, card: Card) -> ApiResponse {
        return ApiResponse(code: code, msg: "")
    }
    
}

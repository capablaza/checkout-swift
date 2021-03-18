import Foundation
@testable import CheckoutSwift

class ApiPaymentStub : ApiPayment{
    
    func transfer(amount: Float, card: Card) -> ApiResponse {
        if(amount <= 0 ){
            return ApiResponse(code: ApiStatus.AMOUNT_INVALID.rawValue, msg: "The amount is not valid")
        }
        return ApiResponse(code: ApiStatus.SUCCESS.rawValue, msg: "the payment was success")
    }
    
    
}

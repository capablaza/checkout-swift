import Foundation

class CheckoutService {
    func checkout(products: [Product], card:Card, api:ApiPayment) -> CheckoutResponse {
        let summary = Summary()
        let balance = summary.balance(products: products)
        
        let taxes = card.taxes(amount: balance)
        
        let amountToPay = balance + taxes;
        
        let response = api.transfer(amount: amountToPay, card: card)
        
        if (response.code == ApiStatus.CARD_NOT_VALID.rawValue) {
            return CheckoutResponse(code: ApiStatus.CARD_NOT_VALID.rawValue, msg: response.message);
        } else if (response.code == ApiStatus.OUT_OF_MONEY.rawValue) {
            return CheckoutResponse(code : ApiStatus.OUT_OF_MONEY.rawValue, msg:  response.message);
        } else if (response.code == ApiStatus.AMOUNT_INVALID.rawValue) {
            return CheckoutResponse(code : ApiStatus.AMOUNT_INVALID.rawValue, msg:  response.message);
        }
        
        return CheckoutResponse(code : ApiStatus.SUCCESS.rawValue, msg : "payment process successfully");
    }
}

import Foundation

protocol ApiPayment {
    func transfer(amount:Float, card: Card) -> ApiResponse    
}

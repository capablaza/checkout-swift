import Foundation

class Card {
    var tax:Float

    init(tax:Float) {
        self.tax = tax
    }
    
    func taxes(amount:Float) -> Float {
        return (amount * self.tax)
    }
}

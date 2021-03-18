import Foundation

class Summary {
    func balance(products:[Product]) -> Float {
        var sum:Float = 0
        
        for p in products {
            sum = sum + p.amount
        }
        
        return sum
    }
}

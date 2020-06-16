import UIKit

struct ValidPrices: Sequence, IteratorProtocol {
    let maxPrice: Int
    let multiplier = 10
    
    var current: Int
    var nextValue: Int
    
    init(_ range: ClosedRange<Int>) {
        current = range.lowerBound
        nextValue = range.lowerBound * multiplier
        maxPrice = range.upperBound
    }
    
    mutating func next() -> String? {
        guard current <= maxPrice else {
            return nil
        }
        
        let result = current
        current = nextValue
        nextValue = nextValue * multiplier
        return "\(result - 1).95 €"
    }
}
// Utilizando lazy para crear listas infinitas, con el protocolo Sequence
for price in ValidPrices(1...500) {
    print(price)
}

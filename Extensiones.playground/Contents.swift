import UIKit
import Foundation

// Extension

//Can be used to:
// -add computed properties
// -add new initializers
// -add protocol conformance
// -add new methods
// -add embedded types


// Double --> Squared
//extension Double {
//    var squared: Double {self * self}
//}
//
//let sideLength: Double = 2.0
//
//let squaredSideLength = sideLength * sideLength
//print(squaredSideLength)
//let squaredSideLength2 = sideLength.squared
//print(squaredSideLength2)

struct Car {
    let maker: String
    let model: String
    let year: Int
    var fuelLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1")
        }
    }
    
}

extension Car: CustomStringConvertible {
    var description: String {
        return "My car is: \(maker) - \(model)"
    }
}

// MARK: - Create new initializers
extension Car {
    init(maker: String, model: String, year: Int){
        self.init(maker: maker, model: model, year: year, fuelLevel: 1)
    }
}

var firstCar = Car(maker: "Honda", model: "Civic", year: 2017, fuelLevel: 1)
print(firstCar)


// MARK: - Nested Types
extension Car {
    enum Era {
        case modern, vintage, veteran
    }
    
    var era: Era {
        let era: Era
        switch year {
        case ...1896:
            era = .veteran
        case 1897...1919:
            era = .vintage
        default:
            era = .modern
        }
        return era
    }
}












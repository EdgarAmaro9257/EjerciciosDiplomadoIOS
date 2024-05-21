import UIKit
import Foundation

//Type constrains

func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}

func checkIfDescriptionMatch<T: CustomStringConvertible & Equatable,
                             U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    first.description == second.description
}

checkIfDescriptionMatch(1, 1)
checkIfDescriptionMatch(1, "1")

struct Car {
    let name: String
    let year: Int
}

extension Car: Equatable {
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.year == rhs.year
    }
    
    static func saySomething() {
        print("Hey I'm a car")
    }
    
    func sayOtherThing() {
        print("-> \(name)")
    }
    
}

let myFirstcar = Car(name: "Corolla", year: 2015)
let secondCar = Car(name: "Civic", year: 2015)

Car.saySomething()
myFirstcar.sayOtherThing()

checkIfEqual(myFirstcar, secondCar)

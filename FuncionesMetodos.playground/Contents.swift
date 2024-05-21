import Foundation
import UIKit

//func myAwsomePrintingFunction() {
//    print("Hello, World!")
//}
//
//myAwsomePrintingFunction()


//func myAwesomePrintingFunction(name: String) {
//    print("Hello, \(name)! Welcome to the Diplomado de Aplicaciones Móviles")
//}
//
//myAwesomePrintingFunction(name: "Alejandro")

//Variadic parameters
//func add(lhs: Int, rhs: Int) {
//    print("\(lhs) + \(rhs) = \(lhs + rhs)")
//}
//
//add(lhs: 2, rhs: 2)


//func printingWelcomeMessage(name: String) {
//  print("Hello \(name)")
//}
//
//printingWelcomeMessage(name: "Alejandro")


//func printingWelcome(message: String, to name: String) {
//    print("\(message): \(name)")
//}
//
//printingWelcome(message: "Hello", to: "Alejandro")


//func printWelcomeMessage(for course: String, to name: String) {
//    print("Welcome to \(course), \(name)")
//}
//
//printWelcomeMessage(for: "Diplomado IOS", to: "Alejandro")


//In-out parameters}
//var error = "The process failed: "
//func appendErrorCode(code: Int, toErrorString errorString: inout String) {
//    errorString += "\(code) bad request"
//}
//
//print(error)
//appendErrorCode(code: 400, toErrorString: &error)
//print(error)


//Returning from a function
//func printWelcomeMessage(to name: String) -> String {
//    let message = "Welcome to the course: \(name)"
//    return message
//}
//
//let welcomeMessage = printWelcomeMessage(to: "Alejandro")
//print(welcomeMessage)
//
////Anidarlo
//print(printWelcomeMessage(to: "Alejandro"))


////Nested Functions and Scope
//func areaOfTriangle(base: Double, height: Double) -> Double {
//    let rectangleArea = base * height
//    
//    func divide() -> Double {
//        return rectangleArea/2
//    }
//    
//    return divide()
//}
//
//let rectangleArea = areaOfTriangle(base: 3, height: 6)
//print("Resultado: \(rectangleArea)")


////Multiple return
//func sortedEvenOddNumber(_ numbers: [Int]) -> (even: [Int], odd: [Int]) {
//    var even = [Int]()
//    var odd = [Int]()
//    
//    for number in numbers {
//        //modulo != remainder
//        if number % 2 == 0 {
//            even.append(number)
//        } else {
//            odd.append(number)
//        }
//    }
//    
//    return (even: even, odd: odd)
//}
//
//let aBunchOfNumbers = [10, 1, 3, 5, 6, 9]
//let sortedNumbers = sortedEvenOddNumber(aBunchOfNumbers)
//
//print(sortedNumbers.even)
//print(sortedNumbers.odd)


// ! --> crash operator
//func grabmiddleName(fromFullName: (String, String?, String)) -> String? {
//    return fromFullName.1
//}
//
////Primera opción
//let middleName = grabmiddleName(fromFullName: ("Alejandro", nil, "Mendoza")) ?? "no middle name"
//
////Segunda opción
//if let middleName = grabmiddleName(fromFullName: ("Alejandro", nil, "Mendoza")) {
//    print(middleName)
//}

//Tercera opción
//print(grabmiddleName(fromFullName: ("Alejandro", nil, "Mendoza"))!)


////Existing early from a function
//func greetByMiddlename(fromFullName name: (first: String, middle: String?, last: String)) -> String {
//    //Primera opción
//    // return "hey, \(name.middle ?? "there")"
//    
//    //return name.middle != nil ? "Hey, \(name.middle)" : "hey there"
////    if let middleName = name.middle {
////        return "Hey, \(middleName)"
////    } else {
////        return "hey there"
////    }
//    
//    guard let middleName = name.middle else {
//        return "hey there"
//    }
//    
//    return "Hey, \(middleName)"
//}



////Multiple return
func sortedEvenOddNumber(_ numbers: [Int]) -> (even: [Int], odd: [Int]) {
    var even = [Int]()
    var odd = [Int]()

    for number in numbers {
        //modulo != remainder
        if number % 2 == 0 {
            even.append(number)
        } else {
            odd.append(number)
        }
    }

    return (even: even, odd: odd)
}



let sortedNumbers: ([Int]) -> ([Int], [Int]) = sortedEvenOddNumber
print(sortedNumbers([1, 3, 4, 5, 7, 10]))


















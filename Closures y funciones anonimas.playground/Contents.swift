import UIKit
import Foundation

// Closures
// Funciones anónimas // Lambda

let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]


func isAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}

let volunteersSorted = volunteerCounts.sorted(by: { lhs, rhs in
    return lhs < rhs
})

print(volunteersSorted)






//func doAwsomeWork(on: "on parameter") {
//    
//} then: {
//    
//}


//func format(numbers: [Double], using formatter: (Double) -> String) -> [String] {
//    var result = [String]()
//    
//    for number in numbers {
//        let transformer = formatter(number)
//        result.append(transformer)
//    }
//    
//    return result
//}
//
//
//let rounder: (Double) -> String = { (number: Double) -> String  in
//    let roundedNumber = number.rounded()
//    let intRounderNumber = Int(roundedNumber)
//    return "\(intRounderNumber)"
//}
//
//let volunteerAverages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]
//
//let roundedVolunteerAverages = format(numbers: volunteerAverages,
//                                      using: rounder)
//
//print(roundedVolunteerAverages)


func format(numbers: [Double], using formatter: (Double) -> String) -> [String] {
    var result = [String]()
    
    for number in numbers {
        let transformer = formatter(number)
        result.append(transformer)
    }
    
    return result
}

func experimentWithScopes() {
    var numberOfTransformation: Int = 0
    let rounder: (Double) -> String = {
        numberOfTransformation += 1
        return "\(Int($0))"
    }
    
    let volunteerAverages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]
    
    let roundedVolunteerAverages = format(numbers: volunteerAverages,
                                          using: rounder)
    print(roundedVolunteerAverages)
    print(numberOfTransformation)
    
}

import UIKit
import Foundation

// Functional programming

// first-class function
// pure functions
// inmutability
// Strong

// Map
// Itera sobre un arreglo y nos devuelve un arreglo del mismo tamaño pero con los elementos tranformados
//let VolunteerAverages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]
//
//let rounderVolunteerAverages = VolunteerAverages.map({(average: Double) -> Int in
//    return Int(average)
//})
//
//let rounderVolunteerAverages2 = VolunteerAverages.map {Int($0)}
//    
//print(rounderVolunteerAverages)
//print(rounderVolunteerAverages2)


// Filter
// Itera sobre un arreglo y nos devuelve un arreglo del mismo "tipo" pero puede ser de un tamaño menor
let VolunteerAverages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]

let invtedVolunteers = VolunteerAverages.filter{ (average: Double) -> Bool in
    return average > 5.0
}

let invtedVolunteers2 = VolunteerAverages.filter{ $0 > 5.0 }

print(invtedVolunteers)
print(invtedVolunteers2)


// Reduce
// Itera sobre un arreglo y nos devuelve un único valor significativo del arreglo

let volunteerAverages = [10.5, 4.3, 7.6, 8.4, 9.3, 2.1]

let totalVolunteers = volunteerAverages.reduce(0) { partialResult, average in
    return partialResult + average
}

print(totalVolunteers)

// map, filter and reduce
// high-order function





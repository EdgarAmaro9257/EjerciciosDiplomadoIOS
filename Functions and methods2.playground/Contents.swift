import Foundation

//Closures

let volunteerCount = [1, 3, 10, 20, 77, 13, 88]

// (Int, Int) -> Bool
func isAscending(_ lhs: Int, _ rhs: Int) -> Bool {
    return lhs < rhs
}

//Primera opción
//let sortedVolunteerCount = volunteerCount.sorted(by: isAscending)
// print(sortedVolunteerCount)


//Segunda opción
//let sortedVolunteerCount2 = volunteerCount.sorted(by: {(lhs: Int, rhs: Int) -> Bool in return lhs < rhs
//})
//print(sortedVolunteerCount2)


////Tercera opción
//let sortedVolunteerCount3 = volunteerCount.sorted(by: {(lhs, rhs) -> Bool in 
//    return lhs < rhs
//})
//print(sortedVolunteerCount3)
//
//
////Cuarta opción
//let sortedVolunteerCount4 = volunteerCount.sorted(by: {(lhs, rhs) -> Bool in
//   lhs < rhs
//})
//print(sortedVolunteerCount4)


//Quinta opción
let sortedVolunteerCount5 = volunteerCount.sorted(by: {$0 < $1})
print(sortedVolunteerCount5)


//Sexta opción
let sortedVolunteerCount6 = volunteerCount.sorted {$0 < $1}
print(sortedVolunteerCount6)





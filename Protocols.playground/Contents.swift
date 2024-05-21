// Tablas
//
protocol TabularDataSource {
    var numberOfRow: Int { get }
    var numberOfColumns: Int { get }
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}


func printTable(_ dataSource: TabularDataSource) {
    var headerRow = "|"
    var columnWidths = [Int]()
    for columnIndex in 0..<dataSource.numberOfColumns {
    let columnLabel = dataSource.label(forColumn: columnIndex)
    let columnHeader = "\(columnLabel)|"
            columnWidths.append(columnLabel.count)
            headerRow += columnHeader
    }
    
    print(headerRow)
    for rowIndex in 0..<dataSource.numberOfRow {
    var output = "|"
    for rowColumnIndex in 0..<dataSource.numberOfColumns {
    let item = dataSource.itemFor(row: rowIndex, column: rowColumnIndex)
    let paddingNeeded = columnWidths[rowColumnIndex] - item.count
    let padding = repeatElement(" ", count: paddingNeeded).joined()
                output += "\(padding)\(item)|"
    }
    print(output)
    }
}


struct Person {
    let name: String
    let age: Int
    let vacationDays: Int
}


struct Department: TabularDataSource {
    let name: String
    var people: [Person]
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    
var numberOfRow: Int { people.count }
var numberOfColumns: Int { 3 }
    
    
func label(forColumn column: Int) -> String {
    let label: String
    switch column {
    case 0: label = "Name"
    case 1: label = "Age"
    case 2: label = "Vacation days"
    default: fatalError("Invalid column")
    }
    return label
}
    
func itemFor(row: Int, column: Int) -> String {
    let person = people[row]
    let item: String
    switch column {
    case 0: item = person.name
    case 1: item = "\(person.age)"
    case 2: item = "\(person.vacationDays)"
    default: fatalError("Invalid column")
    }
    return item
    }
}

var department = Department(name: "Engineering", people: [])
department.add(Person(name: "Eva", age: 30, vacationDays: 6))
department.add(Person(name: "Sal", age: 40, vacationDays: 18))
department.add(Person(name: "Amit", age: 50, vacationDays: 20))

//printTable(data, headings: ["Name", "Age", "Vacation days"])
printTable(department)



//OPCIONAL
let operationalDatSource: TabularDataSource = Department(name: "HR", people: [])
let hrDepartment = department as Department
//as, as?, as!

//let mike = Person(name: "Mike", age: 20, vacationDays: 5)
//mike is Person
//
//hrDepartment is TabularDataSource

//let mySet: Set<String> = []
//mySet is any Collection











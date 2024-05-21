import Foundation

enum AnimalType: String  {
    case mammal = "otra cosa"
    case bird, reptile
    
    var string: String {
        switch self {
        case .bird: return "aves"
        case .mammal: return "mamífero"
        case .reptile: return "reptil"
        }
    }
}

var type1 = AnimalType.bird
type1.string
type1.rawValue
var type2:  AnimalType = .reptile
AnimalType.mammal.rawValue

var arrAnimalTypes: [AnimalType] = [.mammal, .reptile, .bird]
//AnimalType.allCases

//for type in AnimalType.allCases {
  //  print(type.string)
//}

enum Pet: String {
    case dog = "🐶"
    case cat = "🐱"
    case mouse = "🐭"
    case parrot = "🦜"
    case turtle = "🐢"
    
    var type: AnimalType {
        switch self {
        case .dog, .cat, .mouse: return .mammal
        case .parrot: return .bird
        case .turtle: return .reptile
        }
    }
    
    init?(name: String) {
        switch name {
        case "dog": self.init(rawValue: "🐶")
        case "cat": self = .cat
        default: return nil
        }
    }
}

var myPet: Pet = .dog
myPet.rawValue

var yourPet = Pet(rawValue: "🐶")
yourPet

var theirPet = Pet(name: "dog")
Pet(name: "smthelse")
Pet(name: "Cat")

switch theirPet {
case .dog: print("doggo")
case .cat: print("catchy")
default: break
}

enum ContactMethod {
    case email(String)
    case phone(Int)
    case mail(streetName: String, zipCode: String, streetnumber: String)
    
    var value: String {
        switch self {
        case .email(let string): return string
        case .phone(let no): return "\(no)"
        default: return ""
        }
    }
}

var myEmail = ContactMethod.email("grecia@me.com")
var yourEmail = ContactMethod.email("yourMail@me.com")
var myPhone = ContactMethod.phone(555555)

myEmail = myPhone

myEmail.value
yourEmail.value
myPhone.value

switch myEmail {
case .email(let string): print(string)
case .phone(let int): print(int)
case .mail(let streetName, let zipCode, let streetNumber): print(streetName + zipCode + streetNumber)
}

//Funcion para experimento
enum ArithmeticExpression {
    case number(Double)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case substraction(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
    indirect case division(ArithmeticExpression, ArithmeticExpression)
}

//Función para experimento
func eval(expression: ArithmeticExpression) -> Double {
    switch expression {
    case let .number(value): return value
    case let .addition(left, right): return eval(expression: left) + eval(expression: right)
    case let .substraction(left, right): return eval(expression: left) - eval(expression: right)
    case let .multiplication(left, right): return eval(expression: left) * eval(expression: right)
    case let .division(left, right): return eval(expression: left) / eval(expression: right)
    }
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let sum2 = ArithmeticExpression.addition(sum, sum)

eval(expression: sum)


//Experimento

//Operacion: (6 + (4* (8-1)))/2. mostrar decimales
// Operación: (6 + (4 * (8 - 1))) / 2
let expression = ArithmeticExpression.division(
    ArithmeticExpression.addition(
        ArithmeticExpression.number(6),
        ArithmeticExpression.multiplication(
            ArithmeticExpression.number(4),
            ArithmeticExpression.substraction(
                ArithmeticExpression.number(8),
                ArithmeticExpression.number(1)
            )
        )
    ),
    ArithmeticExpression.number(2)
)

let result = eval(expression: expression)
print("El resultado de la operación es: \(result)")

//Otra opcion
let eight = ArithmeticExpression.number(8)
let one = ArithmeticExpression.number(1)
let subs = ArithmeticExpression.substraction(eight, one)
let mult = ArithmeticExpression.multiplication(four, subs)
let six = ArithmeticExpression.number(6)
let suma = ArithmeticExpression.addition(six, mult)
let two = ArithmeticExpression.number(2)
let div = ArithmeticExpression.division(suma, two)

let result2 = eval(expression: expression)
print("Resultado: \(result2)")













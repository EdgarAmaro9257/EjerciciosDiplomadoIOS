import Foundation

struct Dog {
    var name: String {
        willSet {
            print("my new name is \(newValue) my original name was \(name)")
        }
        didSet {
            print("my old name was \(oldValue) my name is \(name)")
        }
    }
    var adopted: Bool
    
    init(adopted name: String) {
        self.adopted = true
        self.name = name
    }
    
    init(bought name: String) {
        self.init(name: name, isAdopted: false)
    }
    
    init(name: String, isAdopted: Bool) {
        self.name = name
        self.adopted = isAdopted
    }
    
}

var dante = Dog(name: "Dante", isAdopted: true)
dante.name = "Firulais"
var yourDog = dante
yourDog.name = "Milaneso"
yourDog.name
dante.name

var theirDog = Dog(adopted: "Rocky")

let hisDog = Dog(bought: "Kyra")

struct Temp {
    static let boilingpoint = 100
}

Temp.boilingpoint

//AYUDA, ME DUERMO
//El futuro de México: Pablito me electrocutaste


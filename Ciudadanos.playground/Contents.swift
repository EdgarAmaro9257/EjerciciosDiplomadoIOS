import Foundation

//var greeting = "Hello, playground"

//POO - Programación orientada a objetos
class Vehicle {
    // brand - Marca
    //Propiedad
    let brand: String
    //var brand: String
    var owner: String?
    let wheels: Int?
    var regNumber: String?
    
    var type: String { //Propiedad Computada
        return (wheels ?? 0) > 0 ? "land" : "other"
    }
    
    var registration: (name: String, number: String)? {
        get {
            if let owner = owner, let regNumber {
                return(owner, regNumber)
            }
            return nil
        }
        set(newRegistration) {
            if let newRegistration {
                owner = newRegistration.name
                regNumber = newRegistration.number
            }
        }
    }
    
    //Constructor - Inicializador
    init(brand: String, wheels: Int? = 4) {
        self.brand = brand
        self.wheels = wheels
    }
    
    //Funciones
    func move(){
        print("moving...")
    }
    
    func stop(){
        print("Stopping...")
    }
}

let myVehicle = Vehicle(brand: "Suzuki")
myVehicle.owner
myVehicle.owner = "Me"
myVehicle.owner
myVehicle.type

let manusVehicle = Vehicle(brand: "Ford")
manusVehicle.owner = "Manuel"
manusVehicle.owner
manusVehicle.type

//manusVehicle.type = "string"
manusVehicle.registration = ("Grecia", "0000001")
manusVehicle.owner
manusVehicle.regNumber
manusVehicle.registration

class Car: Vehicle {
    
    var doors: Int
    
    override var type: String {
        return "Car"
    }
    
    //Override para poder reutilizar las funciones
    override func move() {
        print("my car moves!!!!")
    }
    
    init(doors: Int) {
        self.doors = doors
        super.init(brand: "somebrand", wheels: 4)
    }
    
    
    override func stop() {
        super.stop()
        print("My car is awesome")
    }
}

//var myCar = Car(brand: "Suzuki", wheels: 4)
var myCar = Car(doors: 5)
myCar.owner = "Grecia"
myCar.owner
myCar.move()
myCar.stop()
myCar.wheels

var theirCar = myCar
theirCar.owner = "Them"
theirCar
myCar.owner

































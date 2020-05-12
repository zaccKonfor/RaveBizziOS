import UIKit

//SWIFT CLASS vs Struct

class Coolclass {
    var name: String
    var age: Int
    
    init(_ name: String, age:Int) {
        self.name = name
        self.age = age
    }
    func sayHello() {
        print("hello! My name is \(name) and i am \(age) years old.")
    }
    
}

// Students must initialize Coolclass and  execute sayHello()




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct MyStruct {
   var items: [Any]
    var numberOfItems = 2
mutating func printItems(items: [Any]) {
    for item in items {
                 numberOfItems += 1
                 print("this car is a \(item) and the number of cars are \(numberOfItems)")
    }
    }
}
let cars = ["ford", "lambo", "Ferrari", "porsche", "dodge", "mustang", "chrysler", "GMC", "masaratti", "hummer"]


//Students must execute printItems()using "cars"

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




enum TheEnum {
case first
case second
}

// Students Must Print a random case


let theEnum = TheEnum.first

switch theEnum {
case.first:
    print("this is the first case")
case.second:
    print("this is the second case")
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////






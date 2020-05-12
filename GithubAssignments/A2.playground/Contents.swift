
import Foundation

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Ball: NSObject, NSCopying {
    var shape: String
    var color: String
    var creationDate: Int
    var madeIn: String

    init(shape: String, color: String, date: Int, country: String) {
        self.shape = shape
        self.color = color
        self.creationDate = date
        self.madeIn = country
    }

    func copy(with zone: NSZone? = nil) -> Any {    //Note that copy(with:) is implemented by creating a new Ball Object using the current Ball's information.
        let copy = Ball(shape: shape, color: color, date: creationDate, country: madeIn)
        return copy
    }
}
let addidas = Ball(shape: "Sphere", color: "Green", date: 072020, country: "Vietnam")

//Make and print a new copy of addidas with slightly different features
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


let friends = ["Jack Blackstone", "Johnny Maplewood", "Flint Greenhook", "Declan Velford", "Conrad Banson", "Jason Braxton", "Andy Law"]
let plusOnes = ["Grace Valkyrie", "Anna Hampton", "Lisa Noris", "Christine Harper", "Josephine Sommerville", "Kat jameson", "Ryn Dexter"]



//Print friends and plusOnes using one function and calling it once.

/* ANSWERS SHOULD LOOK LIKE:
hey, Jack Blackstone please come to my party with Grace Valkyrie on Friday!
hey, Johnny Maplewood please come to my party with Anna Hampton on Friday!
hey, Flint Greenhook please come to my party with Lisa Noris on Friday!
hey, Declan Velford please come to my party with Christine Harper on Friday!
hey, Conrad Banson please come to my party with Josephine Sommerville on Friday!
hey, Jason Braxton please come to my party with Kat jameson on Friday!
hey, Andy Law please come to my party with Ryn Dexter on Friday! */

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


let entryCode = true
let enteredDoorCode = entryCode
let passedRetinaScan = entryCode
if enteredDoorCode && passedRetinaScan {
    print("Welcome To The Party!")
} else {
    print("ACCESS DENIED From The Party")
}

//The print() must allow random access to the Party

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





//
//  main.swift
//  AdvancedSwiftProject
//
//  Created by Ozan Çiçek on 15.12.2022.
//

import Foundation

print("Hello, World!")

let classOzan = MusicianClass(name: "ozan", age: 12, type: "BATERI")
let classEmre = MusicianStruct(name: "emre", age: 13, typr: "gitar")

classOzan.happyBirthday()

print(classOzan.age)


//TUPLE


let myTuple : (Name :  String , Notes : [Int]) //arttirilnilir. Sozluk mantigi

myTuple.Name = "ozan"
myTuple.Notes = [1,45,6,5,6,5,5,6]


// Guard Let vs If Let

// Guard -> Negative // direkt olmazsa ne olacagini konusmaya basliyoruz.
// If -> Positive



func converteToIntegerIf( stringInput: String) -> Int {
    
    if let myInteger = Int(stringInput) {
        return myInteger
    }else {
        return 0
    }
}


func convertToIntegerGuard(stringInput : String) -> Int{
    guard let myInteger = Int(stringInput) else{
        return 0
    }
    return myInteger
    
}




//
//  MusicianStruct.swift
//  AdvancedSwiftProject
//
//  Created by Ozan Çiçek on 15.12.2022.
//

import Foundation


struct MusicianStruct {
    var name: String
    var age: Int
    var typr: String
    
    
    mutating func happyBirthday(){
        
        self.age += 1
        
    }
    
    
}

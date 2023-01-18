//
//  UserSingleton.swift
//  SnapchatClone
//
//  Created by Ozan Çiçek on 12.01.2023.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = "kerim"
    var pp = ""
    
    
    private init(){
        
    }
    
    
}

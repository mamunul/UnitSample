//
//  PasswordChecker.swift
//  Sample
//
//  Created by New User on 26/11/19.
//  Copyright © 2019 New User. All rights reserved.
//

import Foundation

enum PasswordError:Error{
    case short
    case long
    case customMessage(message:String)
}

extension PasswordError:Equatable{
    public static func ==(lhs:PasswordError,rhs:PasswordError) ->Bool{
        switch (lhs,rhs) {
        case (.short,.short):
            return true
        case(.long,.long):
            return true
        case(.customMessage,.customMessage):
            return true
        default:
            return false
        }
    }
}

class PasswordChecker {
    
    private  let _password:String
    
    init(password:String) {
        _password = password
    }
    
    func check() throws ->Bool{
        
        guard _password.count > 7 else {
            throw PasswordError.short
        }
        
        guard _password.count < 14 else {
            throw PasswordError.long
        }
        
        guard _password.lowercased() != "password" else{
            throw PasswordError.customMessage(message: "Common password")
        }
        
        return true
    }
    
}

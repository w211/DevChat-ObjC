//
//  AuthService.swift
//  DevChat
//
//  Created by Richard Cuico on 11/18/16.
//  Copyright © 2016 Richard Cuico. All rights reserved.
//

import Foundation
import FirebaseAuth


class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email1: String, password1: String) {
        
        FIRAuth.auth()?.signIn(withEmail: email1, password: password1, completion: { (user, error) in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error as! Int) {
                    if errorCode == .errorCodeUserNotFound {
                        FIRAuth.auth()?.createUser(withEmail: email1, password: password1, completion: { (user, error) in
                            if error != nil {
                                //Show error to user
                            } else {
                                if user?.uid != nil {
                                    // sign in
                                    FIRAuth.auth()?.signIn(withEmail: email1, password: password1, completion: { (user, error) in
                                        if error != nil {
                                            //show error to user
                                        } else {
                                            // we have successfully logged in
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    // handle all other errors
                }
            } else {
                //successfully logged in with existing user
            }
            
        })
    
    }
}

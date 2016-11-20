//
//  AuthService.swift
//  DevChat
//
//  Created by Richard Cuico on 11/18/16.
//  Copyright © 2016 Richard Cuico. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias Completetion = (_ errMsg: String?, _ data: AnyObject?) -> Void

class AuthService {
    private static let _instance = AuthService()
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email1: String, password1: String, onComplete: Completetion?) {
        
        FIRAuth.auth()?.signIn(withEmail: email1, password: password1, completion: { (user, error) in
            
            if error != nil {
                if let errorCode = FIRAuthErrorCode(rawValue: error!._code) {
                    if errorCode == .errorCodeUserNotFound {
                        
                        // Might want to put this somewhere else since if they misspell their user name it'll create a new user
                        FIRAuth.auth()?.createUser(withEmail: email1, password: password1, completion: { (user, error) in
                            if error != nil {
                                
                                self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                            
                            } else {
                                if user?.uid != nil {
                                    // sign in
                                    FIRAuth.auth()?.signIn(withEmail: email1, password: password1, completion: { (user, error) in
                                        if error != nil {

                                            self.handleFirebaseError(error: error as! NSError, onComplete: onComplete)
                                        
                                        } else {
                                            onComplete?(nil, user)
                                        }
                                    })
                                }
                            }
                        })
                    }
                } else {
                    // handle all other errors
                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                }
            } else {
                //successfully logged in with existing user
                onComplete?(nil, user)
            }
            
        })
    
    }
    
    func handleFirebaseError(error: NSError, onComplete: Completetion?) {
        print(error.debugDescription)
        if let errorCode = FIRAuthErrorCode(rawValue: error.code) {
            switch (errorCode) {
            case .errorCodeInvalidEmail:
                onComplete?("Invalid email address", nil)
                break
            case .errorCodeWrongPassword:
                onComplete?("Invalid password", nil)
                break
            case .errorCodeEmailAlreadyInUse, .errorCodeAccountExistsWithDifferentCredential:
                onComplete?("Cannot create account. Email already in use.", nil)
                break
            case .errorCodeWeakPassword:
                onComplete?("Password too weak", nil)
                break
          
            default:
                onComplete?("There was a problem authenticating. Try again.", nil)
            }
        }
    }
    
}

//
//  DataService.swift
//  DevChat
//
//  Created by Richard Cuico on 11/19/16.
//  Copyright © 2016 Richard Cuico. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataService {
    private static let _instance =  DataService()
    
    static var instance: DataService {
        return _instance
    }

    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child("users")
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        mainRef.child("users").child(uid).child("profile").setValue(profile)
    }

}



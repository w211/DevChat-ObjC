//
//  DataService.swift
//  DevChat
//
//  Created by Richard Cuico on 11/19/16.
//  Copyright © 2016 Richard Cuico. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

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
    
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: "gs://devchat-a87d7.appspot.com")
    }
    
    var imageStorageRef: FIRStorageReference {
        return mainStorageRef.child("images")
    }
    
    var videoStorageRef: FIRStorageReference {
        return mainStorageRef.child("videos")
    }
    
    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        mainRef.child("users").child(uid).child("profile").setValue(profile)
    }

    func sendMediaPullRequest(senderUID: String, sendingTo:Dictionary<String, User>, mediaURL: URL, textSnippet: String? = nil) {
        
        var pr: Dictionary<String, AnyObject> = ["mediaUrl":mediaURL.absoluteString as AnyObject, "userID":senderUID as AnyObject, "openCount": 0 as AnyObject, "usersSentTo": sendingTo.keys as AnyObject]
        
        mainRef.child("pullRequests").childByAutoId().setValue(pr)
        
    }
    
}



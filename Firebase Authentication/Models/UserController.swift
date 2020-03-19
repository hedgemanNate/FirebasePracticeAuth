//
//  UserController.swift
//  Firebase Authentication
//
//  Created by Nathan Hedgeman on 3/11/20.
//  Copyright © 2020 Nathan Hedgeman. All rights reserved.
//

import Foundation
import Firebase

class UserController {
    
    var currentUser = User()
}


//FUNCTIONS
extension UserController {
    // This function passes the Firebase Auth.auth().currentUser data over to the custom created user.
    func passAuthUserData() {
        guard let fireUser = Auth.auth().currentUser else { return NSLog("User Controller: No current user")}
        currentUser.uid = fireUser.uid
        currentUser.emailAddress = fireUser.email!
        currentUser.photoURL = fireUser.photoURL
        currentUser.phoneNumber = fireUser.phoneNumber
        currentUser.displayName = fireUser.displayName
        currentUser.isEmailVarified = fireUser.isEmailVerified
        
    }
}

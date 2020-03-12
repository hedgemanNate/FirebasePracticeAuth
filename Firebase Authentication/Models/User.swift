//
//  User.swift
//  Firebase Authentication
//
//  Created by Nathan Hedgeman on 3/11/20.
//  Copyright © 2020 Nathan Hedgeman. All rights reserved.
//

import Foundation

class User: Codable {
    
    let uid: String
    let emailAddress: String
    let photoURL: String
    
    init(uid: String, emailAddress: String, photoURL: String) {
        self.uid = uid
        self.emailAddress = emailAddress
        self.photoURL = photoURL
    }
}

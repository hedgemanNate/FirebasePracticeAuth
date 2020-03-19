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
    var photoURL: String?
    var userdata1 = ""
    var userdata2 = ""
    var userdata3 = ""
    
    init(uid: String, emailAddress: String) {
        self.uid = uid
        self.emailAddress = emailAddress
        
    }
}

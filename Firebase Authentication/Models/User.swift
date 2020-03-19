//
//  User.swift
//  Firebase Authentication
//
//  Created by Nathan Hedgeman on 3/11/20.
//  Copyright © 2020 Nathan Hedgeman. All rights reserved.
//

import Foundation

class User: Codable {
    
    var uid: String
    var displayName: String?
    var emailAddress: String
    var photoURL: URL?
    var phoneNumber: String?
    var userdata1 = ""
    var userdata2 = ""
    var userdata3 = ""
    var isEmailVarified: Bool = false
    
    init(uid: String, emailAddress: String) {
        self.uid = uid
        self.emailAddress = emailAddress
        
    }
}

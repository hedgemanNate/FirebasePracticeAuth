//
//  User.swift
//  Firebase Authentication
//
//  Created by Nathan Hedgeman on 3/11/20.
//  Copyright © 2020 Nathan Hedgeman. All rights reserved.
//

import Foundation

class User: Codable {
    
    var username: String?
    let emailAddress: String
    let password: String
    
    init(emailAddress: String, password: String) {
        self.emailAddress = emailAddress
        self.password = password
    }
}

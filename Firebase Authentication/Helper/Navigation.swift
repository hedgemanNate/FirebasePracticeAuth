//
//  Navigation.swift
//  Firebase Authentication
//
//  Created by Nathan Hedgeman on 3/12/20.
//  Copyright © 2020 Nathan Hedgeman. All rights reserved.
//

import Foundation
import UIKit

class Navigation: UIViewController {
    
    func toAuthController() {
        let authVC = mainSB.instantiateViewController(identifier: "AuthenticationViewController") as AuthenticationViewController
        authVC.modalPresentationStyle = .fullScreen
        self.present(authVC, animated: true, completion: nil)
    }
    
    func toLoginController() {
        let loginVC = mainSB.instantiateViewController(identifier: "LoggedInViewController") as LoggedInViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func toProfileEditController() {
        let profileVC = mainSB.instantiateViewController(identifier: "ProfileEditViewController") as ProfileEditViewController
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
    }
}

//
//  LoggedInViewController.swift
//  Firebase Authentication
//
//  Created by Nathan Hedgeman on 3/12/20.
//  Copyright © 2020 Nathan Hedgeman. All rights reserved.
//

import UIKit
import Firebase

class LoggedInViewController: UIViewController {
    
    //Properties
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //updateViews()
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print(error)
        }
        print("logged out")
        DispatchQueue.main.async {
            self.navigateToAuthController()
        }
    }
    @IBAction func editButtonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.navigateToProfileEditController()
        }
    }
    
    //Functions
    
    private func updateViews() {
        let user = Auth.auth().currentUser
        displayNameLabel.text = user?.displayName
        emailLabel.text = user?.email
        idLabel.text = user?.uid
    }
    
    func navigateToAuthController() {
        let authVC = mainSB.instantiateViewController(identifier: "AuthenticationViewController") as AuthenticationViewController
        authVC.modalPresentationStyle = .fullScreen
        self.present(authVC, animated: true, completion: nil)
    }
    
    func navigateToLoginController() {
        let loginVC = mainSB.instantiateViewController(identifier: "LoggedInViewController") as LoggedInViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
    
    func navigateToProfileEditController() {
        let profileVC = mainSB.instantiateViewController(identifier: "ProfileEditViewController") as ProfileEditViewController
        profileVC.modalPresentationStyle = .fullScreen
        self.present(profileVC, animated: true, completion: nil)
    }
    
}

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
    let userController = UserController()
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var data1TextField: UITextField!
    @IBOutlet weak var data2TextField: UITextField!
    @IBOutlet weak var data3TextField: UITextField!
    
    
    
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
        displayNameLabel.text = userController.currentUser.displayName
        emailLabel.text = userController.currentUser.emailAddress
        idLabel.text = userController.currentUser.uid
        data1TextField.text = userController.currentUser.userdata1
        data2TextField.text = userController.currentUser.userdata2
        data3TextField.text = userController.currentUser.userdata3
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

//
//  ProfileEditViewController.swift
//  Firebase Authentication
//
//  Created by Nathan Hedgeman on 3/12/20.
//  Copyright © 2020 Nathan Hedgeman. All rights reserved.
//

import UIKit
import Firebase

class ProfileEditViewController: UIViewController {
    
    //Properties
    @IBOutlet weak var displayNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userData1TextField: UITextField!
    @IBOutlet weak var userData2TextField: UITextField!
    @IBOutlet weak var userData3TextField: UITextField!
    
    var
    
    private let user = Auth.auth().currentUser
    private let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let displayName = displayNameTextField.text,
            let email = emailTextField.text,
        let data1 = userData1TextField.text,
        let data2 = userData2TextField.text,
        let data3 = userData3TextField.text else {return}
        
        if user?.email == email {
            print("email is the same")
        } else {
            
            user?.updateEmail(to: email, completion: { (error) in
                if let error = error {
                    NSLog("Error updating email address: \(error)")
                    let alert = UIAlertController(title: "Error updating your email address.", message: "Try again and make sure your email address is correct.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok, I'll Check", style: .default, handler: nil))
                    DispatchQueue.main.async {
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            })
        }
        
        changeRequest?.displayName = displayName
        changeRequest?.commitChanges(completion: { (error) in
            if let error = error {
                
                NSLog("Error updateing display name: \(error)")
                let alert = UIAlertController(title: "Error updating your username.", message: "Try again later.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                    self.navigateToLoginController()
                }))
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                
                let alert = UIAlertController(title: "Success!", message: "Profile updated.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (_) in
                    self.navigateToLoginController()
                }))
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                    
                }
            }
        })
    }
    
    private func updateViews() {
        if user?.displayName == nil {
            displayNameTextField.placeholder = "Choose a username."
        } else {
            displayNameTextField.text = user?.displayName
        }
        emailTextField.text = user?.email
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

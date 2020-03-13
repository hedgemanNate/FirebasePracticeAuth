//
//  AuthenticationViewController.swift
//  
//
//  Created by Nathan Hedgeman on 3/11/20.
//

import UIKit
import FirebaseAuth

class AuthenticationViewController: UIViewController {
    
    let userController = UserController()
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "nate.hedgeman@gmail.com"
        passwordTextField.text = "james911"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpButton(_ sender: Any) {
        
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {return print("No info")}
        
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                NSLog("Error creating user: \(error)")
            } else {
                NSLog("User Created")
            }
            if let authDataResult = authDataResult {
                print(authDataResult)
            }
        }
    }
    
    @IBAction func signInButton(_ sender: Any) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else {return print("No info")}
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if let error = error {
                NSLog("Error signing user in: \(error)")
            } else {
                NSLog("User Signed In")
                
                if let authDataResult = authDataResult {
                    print(authDataResult.user)
                }
                DispatchQueue.main.async {
                    self.navigateToLoginController()
                }
            }
        }
    }
    
    private func navigateToLoginController() {
        let loginVC = mainSB.instantiateViewController(identifier: "LoggedInViewController") as LoggedInViewController
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
    }
    
    
}

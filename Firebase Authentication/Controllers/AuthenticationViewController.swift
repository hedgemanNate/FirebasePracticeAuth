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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
                    self.performSegue(withIdentifier: "signInSegue", sender: nil)
                }
            }
        }
    }
    
    
}

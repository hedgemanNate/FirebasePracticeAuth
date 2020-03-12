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
    
    private let user = Auth.auth().currentUser
    private let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
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
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let displayName = displayNameTextField.text,
              let email = emailTextField.text else {return}
        
        changeRequest?.displayName = displayName
        if user?.email == email {
            return
        } else {
            user?.updateEmail(to: email, completion: { (error) in
                if let error = error {
                    NSLog("Error updating email address: \(error)")
                    let alert = UIAlertController(title: "Error updating your email address.", message: "Try again and make sure your email address is correct.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok, I'll Check", style: .default, handler: nil))
                } else {
                    let alert = UIAlertController(title: "Success!", message: "You profile has been updated.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (_) in
                        DispatchQueue.main.async {
                            self.dismiss(animated: true, completion: nil)
                        }
                    }))
                }
            })
        }
    }
    
    private func updateViews() {
        if user?.displayName == nil {
            displayNameTextField.placeholder = "Choose a username."
        } else {
            displayNameTextField.text = user?.displayName
        }
        emailTextField.text = user?.email
    }
    
}

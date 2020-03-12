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

    override func viewDidLoad() {
        super.viewDidLoad()

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
    @IBAction func logOutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let error as NSError {
            print(error)
        }
    }
    
}

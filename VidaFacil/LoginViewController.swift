//
//  LoginViewController.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 22/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        ServicesManager.sharedInstance.api.login(user: emailField.text ?? "", password: passwordField.text ?? "") { (result, error) in
            if let _error = error {
                self.showError(_error)
            } else if let _result = result {
                print(_result)
                self.performSegue(withIdentifier: "Login-Main", sender: nil)
            }
        }
    }
    
}

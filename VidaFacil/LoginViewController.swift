//
//  LoginViewController.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 22/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "Login-Main", sender: nil)
    }
    
}

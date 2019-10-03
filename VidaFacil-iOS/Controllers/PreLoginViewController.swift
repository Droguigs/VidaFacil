//
//  PreLoginViewController.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 08/08/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class PreLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - Navigation
    
    @IBAction func signIn(_ sender: Any) {
        self.performSegue(withIdentifier: "PreLogin-Login", sender: sender)
    }
    
    @IBAction func signUp(_ sender: Any) {
        self.performSegue(withIdentifier: "PreLogin-SignUp", sender: sender)    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}

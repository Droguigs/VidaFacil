//
//  UserDetailsViewController.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 13/08/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

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
    @IBAction func useDiscount(_ sender: Any) {
        self.performSegue(withIdentifier: "UserDetails-Evaluation", sender: self)
    }
    
}

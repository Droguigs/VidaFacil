//
//  LoginCollectionViewCell.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 29/03/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class LoginCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var delegate: SegueDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func forgotPassword(_ sender: Any) {
    }
    
    @IBAction func login(_ sender: Any) {
        delegate.login(name: "", password: "")
    }
    
    @IBAction func newAccount(_ sender: Any) {
    }
    
}

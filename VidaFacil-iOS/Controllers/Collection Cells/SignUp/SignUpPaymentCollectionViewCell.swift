//
//  SignUpPaymentCollectionViewCell.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 14/09/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class SignUpPaymentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var flagText: UITextField!
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var expirationText: UITextField!
    @IBOutlet weak var expirationYear: UITextField!
    @IBOutlet weak var cvvText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

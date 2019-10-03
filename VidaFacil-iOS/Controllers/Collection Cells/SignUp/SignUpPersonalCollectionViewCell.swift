//
//  SignUpPersonalCollectionViewCell.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 14/09/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class SignUpPersonalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var cpfText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    var delegate: SignUpDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

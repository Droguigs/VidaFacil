//
//  SignUpLocationCollectionViewCell.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 14/09/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class SignUpLocationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var stateText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var cepText: UITextField!
    @IBOutlet weak var address2Text: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

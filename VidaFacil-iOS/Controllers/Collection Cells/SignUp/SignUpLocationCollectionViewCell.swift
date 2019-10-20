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
    
    var picker = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stateText.inputView = picker
        
        stateText.backgroundColor = .white
        stateText.textColor = .black
        stateText.attributedPlaceholder = NSAttributedString(string: "Estado",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        cityText.backgroundColor = .white
        cityText.textColor = .black
        cityText.attributedPlaceholder = NSAttributedString(string: "Cidade",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        addressText.backgroundColor = .white
        addressText.textColor = .black
        addressText.attributedPlaceholder = NSAttributedString(string: "Endereço",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        cepText.backgroundColor = .white
        cepText.textColor = .black
        cepText.attributedPlaceholder = NSAttributedString(string: "CEP",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        address2Text.backgroundColor = .white
        address2Text.textColor = .black
        address2Text.attributedPlaceholder = NSAttributedString(string: "Complemento",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }

}

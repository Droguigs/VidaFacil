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
        
        nameText.backgroundColor = .white
        nameText.textColor = .black
        nameText.attributedPlaceholder = NSAttributedString(string: "Nome Completo",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        phoneText.backgroundColor = .white
        phoneText.textColor = .black
        phoneText.attributedPlaceholder = NSAttributedString(string: "Telefone",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        birthdayText.backgroundColor = .white
        birthdayText.textColor = .black
        birthdayText.attributedPlaceholder = NSAttributedString(string: "Data de Nascimento",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        cpfText.backgroundColor = .white
        cpfText.textColor = .black
        cpfText.attributedPlaceholder = NSAttributedString(string: "CPF",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailText.backgroundColor = .white
        emailText.textColor = .black
        emailText.attributedPlaceholder = NSAttributedString(string: "Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }

}

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
        
        flagText.backgroundColor = .white
        flagText.textColor = .black
        flagText.attributedPlaceholder = NSAttributedString(string: "Cartão/Bandeira",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        numberText.backgroundColor = .white
        numberText.textColor = .black
        numberText.attributedPlaceholder = NSAttributedString(string: "Número",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        expirationText.backgroundColor = .white
        expirationText.textColor = .black
        expirationText.attributedPlaceholder = NSAttributedString(string: "Mês de expiração",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        expirationYear.backgroundColor = .white
        expirationYear.textColor = .black
        expirationYear.attributedPlaceholder = NSAttributedString(string: "Ano de expiração",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        cvvText.backgroundColor = .white
        cvvText.textColor = .black
        cvvText.attributedPlaceholder = NSAttributedString(string: "Código de Segurança",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        nameText.backgroundColor = .white
        nameText.textColor = .black
        nameText.attributedPlaceholder = NSAttributedString(string: "Nome no Cartão",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordText.backgroundColor = .white
        passwordText.textColor = .black
        passwordText.attributedPlaceholder = NSAttributedString(string: "Senha",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        password2Text.backgroundColor = .white
        password2Text.textColor = .black
        password2Text.attributedPlaceholder = NSAttributedString(string: "Confirmar Senha",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }

}

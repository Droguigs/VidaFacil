//
//  LocaleTableViewCell.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 29/03/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit
import SDWebImage

class LocaleTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var localeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCellDetails(image: String, name: String, quantity: Int) {
        if image == "Icon" {
            myImage.image = UIImage(named: image)
        } else {
            myImage.sd_setImage(with: image.toUrl()!, placeholderImage: UIImage(named: "Icon"))
        }
        localeLabel.text = name
        quantityLabel.text = "\(quantity)"
    }
    
}

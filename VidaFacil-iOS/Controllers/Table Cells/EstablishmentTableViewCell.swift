//
//  EstablishmentTableViewCell.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 10/08/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit
import SDWebImage

class EstablishmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var establishmentImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(name title: String, description: String, percentage: String) {
        establishmentImage.image = #imageLiteral(resourceName: "pig_icon")
        titleLabel.text = title
        titleLabel.textColor = .black
        descriptionLabel.text = description
        descriptionLabel.textColor = .black
        percentageLabel.text = percentage
        percentageLabel.textColor = .white
    }

}

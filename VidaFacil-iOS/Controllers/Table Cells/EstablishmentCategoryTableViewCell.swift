//
//  EstablishmentCategoryTableViewCell.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 08/10/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//
import UIKit
import SDWebImage

class EstablishmentCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var establishmentImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var averageGrade: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(image url: URL?, name title: String, description: String, average: String) {
        establishmentImage.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "pig_icon"))
        titleLabel.text = title
        titleLabel.textColor = .black
        descriptionLabel.text = description
        descriptionLabel.textColor = .black
        averageGrade.text = average
        averageGrade.textColor = .black
    }

}

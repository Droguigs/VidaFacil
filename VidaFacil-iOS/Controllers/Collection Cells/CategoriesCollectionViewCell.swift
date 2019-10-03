//
//  CategoriesCollectionViewCell.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 10/08/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit
import SDWebImage

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    func setupView(url: URL?) {
        self.image.sd_setImage(with: url) { (image, error, type, url) in }
    }
    
}

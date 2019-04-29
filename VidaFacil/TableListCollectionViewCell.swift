//
//  TableListCollectionViewCell.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 29/03/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class TableListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    let locales: [(String, Int)] = [("Postos", 2),
                                    ("Farmácias", 12),
                                    ("Bares", 42),
                                    ("Restaurantes", 23)]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadNibs() {
        tableView.register(ArtTableViewCell.nib, forCellReuseIdentifier: ArtTableViewCell.identifier)
        tableView.register(LocaleTableViewCell.nib, forCellReuseIdentifier: LocaleTableViewCell.identifier)
    }
    
    func setupCell() {
        loadNibs()
    }
    
}

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
    
}

//MARK: TableView Delegate Methods
extension TableListCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return locales.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: ArtTableViewCell.identifier, for: indexPath)
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: LocaleTableViewCell.identifier, for: indexPath) as! LocaleTableViewCell
            cell.setCellDetails(image: "icon", name: locales[indexPath.row].0, quantity: locales[indexPath.row].1)
            return cell
        }
    }
}

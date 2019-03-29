//
//  ViewController.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 26/03/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func loadNibs() {
        collectionView.register(AboutCollectionViewCell.nib, forCellWithReuseIdentifier: AboutCollectionViewCell.identifier)
        collectionView.register(LoginCollectionViewCell.nib, forCellWithReuseIdentifier: LoginCollectionViewCell.identifier)
        collectionView.register(TableListCollectionViewCell.nib, forCellWithReuseIdentifier: TableListCollectionViewCell.identifier)
    }

}

//MARK: COllection Delegate Methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableListCollectionViewCell.identifier, for: indexPath) as! TableListCollectionViewCell
            
            _ = cell.contentView
            cell.setupCell()
            
            return cell
        case 1:
            return collectionView.dequeueReusableCell(withReuseIdentifier: TableListCollectionViewCell.identifier, for: indexPath)
        case 2:
            return collectionView.dequeueReusableCell(withReuseIdentifier: TableListCollectionViewCell.identifier, for: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
}

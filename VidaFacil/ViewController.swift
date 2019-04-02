//
//  ViewController.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 26/03/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

protocol segueDelegate {
    func login(name: String, password: String)
    func localeType(index: Int)
    func tutorial()
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var categoriesButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNibs()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func loadNibs() {
        collectionView.register(AboutCollectionViewCell.nib, forCellWithReuseIdentifier: AboutCollectionViewCell.identifier)
        collectionView.register(LoginCollectionViewCell.nib, forCellWithReuseIdentifier: LoginCollectionViewCell.identifier)
        collectionView.register(TableListCollectionViewCell.nib, forCellWithReuseIdentifier: TableListCollectionViewCell.identifier)
    }

}

//MARK: COllection Delegate Methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
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
            return collectionView.dequeueReusableCell(withReuseIdentifier: LoginCollectionViewCell.identifier, for: indexPath)
        case 2:
            return collectionView.dequeueReusableCell(withReuseIdentifier: AboutCollectionViewCell.identifier, for: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
}

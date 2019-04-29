//
//  ViewController.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 26/03/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

protocol SegueDelegate {
    func login(name: String, password: String)
    func localeType(index: Int)
    func tutorial()
}

class ViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var categoriesButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    
    var locales: [EstablishmentCategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNibs()
        
        loadEstablishments()
        
        self.navigationItem.title = "Categorias"
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func loadNibs() {
        collectionView.register(AboutCollectionViewCell.nib, forCellWithReuseIdentifier: AboutCollectionViewCell.identifier)
        collectionView.register(TableListCollectionViewCell.nib, forCellWithReuseIdentifier: TableListCollectionViewCell.identifier)
    }
    
    private func loadEstablishments() {
        self.showLoading()
        ServicesManager.sharedInstance.api.categories(categoryId: nil) { (result, error) in
            self.stopLoading()
            if let _error = error {
                self.showError(_error)
            } else if let _result = result {
                self.locales = _result.data ?? []
                let cell = self.collectionView(self.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as! TableListCollectionViewCell
                cell.tableView.reloadData()
            }
        }
    }
    
    private func setButtonTextToBold(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            categoriesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
            aboutButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
            
        default:
            categoriesButton.titleLabel?.font = UIFont.systemFont(ofSize: 16.0)
            aboutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        }
    }
    
    @IBAction func scrollTo( _ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.navigationItem.title = "Categorias"
            setButtonTextToBold(indexPath: IndexPath(row: 0, section: 0))
            
            collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
        default:
            self.navigationItem.title = "Sobre"
            setButtonTextToBold(indexPath: IndexPath(row: 1, section: 0))
            
            collectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: true)
        }
    }

}

//MARK: TableView Delegate Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
            cell.setCellDetails(image: locales[indexPath.row].icon ?? "icon", name: locales[indexPath.row].name, quantity: locales[indexPath.row].establishmentsCount ?? 0)
            return cell
        }
    }
}

//MARK: Collection Delegate Methods
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableListCollectionViewCell.identifier, for: indexPath) as! TableListCollectionViewCell
            
            _ = cell.contentView
            cell.setupCell()
            cell.tableView.delegate = self
            cell.tableView.dataSource = self
            
            return cell
        case 1:
            return collectionView.dequeueReusableCell(withReuseIdentifier: AboutCollectionViewCell.identifier, for: indexPath)
        default:
            return UICollectionViewCell()
        }
    }
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint)
        
        setButtonTextToBold(indexPath: visibleIndexPath!)
    }
}

extension ViewController: SegueDelegate {
    
    func login(name: String, password: String) { }
    
    func localeType(index: Int) {}
    func tutorial() {}
    
}

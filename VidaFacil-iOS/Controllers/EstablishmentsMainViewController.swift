//
//  EstablishmentsMainViewController.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 11/08/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class EstablishmentsMainViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var collectionArray: [(Int, URL?)] = []
    var tableArray: [Establishment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDelegates()
        setupCollection()
    }
    
    func setupDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func setupCollection() {
        self.showLoading()
        ServicesManager.sharedInstance.api.categories(categoryId: nil) { (result, error) in
            self.stopLoading()
            if let _error = error {
                self.showError(_error)
            } else if let data = result?.data {
                for item in data {
                    self.collectionArray.append((item.id, item.icon?.toUrl()))
                    self.collectionView.reloadData()
                }
                if data.count > 0 {
                    self.setupTable(id: data[0].id)
                }
            }
        }
    }
    
    func setupTable(id categoryId: Int) {
        self.showLoading()
        ServicesManager.sharedInstance.api.establishments(establishmentId: nil, categoryId: categoryId, latitude: "-31.7152834", longitude: "-52.3567087") { (result, error) in
            self.stopLoading()
            if let data = result?.data {
                self.tableArray = data
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func SegmentControlChanged(_ sender: Any) {
        
    }
    
    
}

extension EstablishmentsMainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EstablishmentsMainViewTableCell", for: indexPath) as! EstablishmentTableViewCell
        if let array = tableArray[indexPath.row].average {
            cell.setup(name: tableArray[indexPath.row].image?.toUrl(), name: tableArray[indexPath.row].description, description: "", average: String(array.average))
        } else {
            cell.setup(name: tableArray[indexPath.row].image?.toUrl(), name: tableArray[indexPath.row].description, description: "", average: "-")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Menu-Details", sender: self)
    }
    
}

extension EstablishmentsMainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EstablishmentsMainViewCollectionCell", for: indexPath) as! CategoriesCollectionViewCell
        
        cell.setupView(url: collectionArray[indexPath.row].1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.setupTable(id: collectionArray[indexPath.row].0)
    }
    
}

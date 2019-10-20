//
//  EstablishmentsMainViewController.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 11/08/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit
import MMDrawerController

class EstablishmentsMainViewController: BaseViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var collectionArray: [(Int, URL?)] = []
    var tableArray: [Establishment] = []
    
    var establishment = Establishment()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenu()
        setupDelegates()
        setupCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.backgroundColor = .white
        self.label.textColor = .black
        self.segmentControl.selectedSegmentTintColor = UIColor(hex: "588829")
        self.segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        self.segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
    }
    
    func setupMenu() {
        
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
        ServicesManager.sharedInstance.api.establishmentCategory(categoryId: categoryId, latitude: "-31.7152834", longitude: "-52.3567087") { (result, error) in
            self.stopLoading()
            if let data = result?.data {
                self.tableArray = data
                self.tableView.reloadData()
            }
        }
    }

    @IBAction func SegmentControlChanged(_ sender: Any) {
        
    }
    
    @IBAction func menuButtonClick(_ sender: Any) {
        
    }
    
    @IBAction func searchButtonClick(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! DetailsViewController
        destinationVC.establishment = self.establishment
    }
    
}

extension EstablishmentsMainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EstablishmentCategoryTableViewCell", for: indexPath) as! EstablishmentCategoryTableViewCell
        cell.backgroundColor = .white
        
        if let array = tableArray[indexPath.row].average {
            cell.setup(image: tableArray[indexPath.row].image?.toUrl(), name: tableArray[indexPath.row].description, description: "", average: String(array.average))
        } else {
            cell.setup(image: tableArray[indexPath.row].image?.toUrl(), name: tableArray[indexPath.row].description, description: "", average: "-")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
        self.establishment = tableArray[indexPath.row]
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

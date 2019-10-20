//
//  DetailsViewController.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 13/08/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    var establishment: Establishment?
    var establishments: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupData() {
        self.imageView.sd_setImage(with: establishment?.image.toUrl(), placeholderImage: #imageLiteral(resourceName: "pig_icon"))
        self.titleLabel.text = establishment?.description ?? "Estabelecimento"
        self.streetLabel.text = establishment?.address ?? ""
        self.phoneLabel.text = establishment?.phone ?? ""
        if let grade = establishment?.average?.average {
            self.gradeLabel.text = "\(grade)"
        } else {
            self.gradeLabel.text = "-"
        }
        ServicesManager.sharedInstance.api.establishments(establishmentId: establishment?.id ?? 0) { (result, error) in
            if let _error = error {
                self.showError(_error)
            } else if let _result = result {
                self.establishments = _result.data?.products ?? []
                self.tableView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.titleLabel.textColor = .black
        self.streetLabel.textColor = .black
        self.phoneLabel.textColor = .black
        self.gradeLabel.textColor = .black
        self.tableView.backgroundColor = .white
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return establishments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EstablishmentTableViewCell.identifier, for: indexPath) as! EstablishmentTableViewCell
        
        cell.setup(name: establishments[indexPath.row].description, description: establishments[indexPath.row].discountType?.description ?? "", percentage: establishments[indexPath.row].discount + "%")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: false)
//        ServicesManager.sharedInstance.api
        performSegue(withIdentifier: "Details-QR", sender: self)
    }
    
}

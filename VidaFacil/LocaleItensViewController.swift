//
//  LocaleItensViewController.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 01/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class LocaleItensViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Navigation
    func QRReader() {
        self.performSegue(withIdentifier: "Locale-Discount", sender: nil)
    }

}

extension LocaleItensViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

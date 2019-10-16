//
//  SignUpViewController.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 15/09/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

protocol SignUpDelegate {
    
    func getImage()
    
}

class SignUpViewController: BaseViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    var signUpData = SignUpData()
    
    var indexPath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNibs()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func loadNibs() {
        collectionView.register(SignUpLocationCollectionViewCell.nib, forCellWithReuseIdentifier: SignUpLocationCollectionViewCell.identifier)
        collectionView.register(SignUpPaymentCollectionViewCell.nib, forCellWithReuseIdentifier: SignUpPaymentCollectionViewCell.identifier)
        collectionView.register(SignUpPersonalCollectionViewCell.nib, forCellWithReuseIdentifier: SignUpPersonalCollectionViewCell.identifier)
    }
    
    @IBAction func segmentControlDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            refreshData(0)
            indexPath = 0
            collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: true)
            collectionViewHeight.constant = 305
        case 1:
            refreshData(1)
            indexPath = 1
            collectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: true)
            collectionViewHeight.constant = 214
        default:
            refreshData(2)
            indexPath = 2
            collectionView.scrollToItem(at: IndexPath(row: 2, section: 0), at: .centeredHorizontally, animated: true)
            collectionViewHeight.constant = 374
        }
    }
    
    @IBAction func nextDidClick(_ sender: Any) {
        switch indexPath {
        case 0:
            refreshData(0)
            indexPath = 1
            self.segmentControl.selectedSegmentIndex = 1
            collectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: true)
            collectionViewHeight.constant = 214
        case 1:
            refreshData(1)
            indexPath = 2
            self.segmentControl.selectedSegmentIndex = 2
            collectionView.scrollToItem(at: IndexPath(row: 2, section: 0), at: .centeredHorizontally, animated: true)
            collectionViewHeight.constant = 374
        default:
            refreshData(2)
            if signUpData.checkNil() {
//                ServicesManager.sharedInstance.api
                self.performSegue(withIdentifier: "SignUp-Main", sender: self)
            } else {
                self.showMessage("Favor preencher todos os campos.")
            }
        }
    }
    
    func refreshData(_ id: Int) {
        let cell = collectionView.cellForItem(at: IndexPath(row: indexPath, section: 0))
        signUpData.setData(at: indexPath, cell: cell)
    }
    
}

extension SignUpViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 305)
        case 1:
            return CGSize(width: collectionView.frame.width, height: 214)
        default:
            return CGSize(width: collectionView.frame.width, height: 374)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignUpPersonalCollectionViewCell.identifier, for: indexPath) as! SignUpPersonalCollectionViewCell
            cell.delegate = self
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignUpLocationCollectionViewCell.identifier, for: indexPath)
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SignUpPaymentCollectionViewCell.identifier, for: indexPath)
            
            return cell
        }
    }
}

extension SignUpViewController: SignUpDelegate {
    
    func getImage() {
        ImagePickerManager().pickImage(self) { image in
            self.signUpData.photo = image.jpegData(compressionQuality: 0.6)
            let cell = self.collectionView.cellForItem(at: IndexPath(row: 0, section: 0)) as! SignUpPersonalCollectionViewCell
            cell.imageView.image = image
        }
    }
    
}

class SignUpData {
    
    var name: String?
    var email: String?
    var password: String?
    var cpf: String?
    var cep: String?
    var stateId: Int?
    var city: String?
    var neighborhood: String?
    var address: String?
    var phone: String?
    var birthday: String?
    var active: String?
    var number: String?
    var holder: String?
    var expirationMonth: Int?
    var expirationYear: Int?
    var cvv: Int?
    var brand: String?
    var photo: Data?
    
    func checkNil() -> Bool {
        if name != nil,
            email != nil,
            password != nil,
            cpf != nil,
            cep != nil,
            stateId != nil,
            city != nil,
            neighborhood != nil,
            address != nil,
            phone != nil,
            birthday != nil,
            active != nil,
            number != nil,
            holder != nil,
            expirationMonth != nil,
            expirationYear != nil,
            cvv != nil,
            brand != nil,
            photo != nil {
            return true
        }
        return false
    }
    
    func setData(at index: Int, cell: UICollectionViewCell?) {
        switch index {
        case 0:
            if let c = cell {
                self.name     = (c as! SignUpPersonalCollectionViewCell).nameText.text
                self.phone    = (c as! SignUpPersonalCollectionViewCell).phoneText.text
                self.birthday = (c as! SignUpPersonalCollectionViewCell).birthdayText.text
                self.cpf      = (c as! SignUpPersonalCollectionViewCell).cpfText.text
                self.email    = (c as! SignUpPersonalCollectionViewCell).emailText.text
            }
            break
        case 1:
            if let c = cell {
                self.stateId  = Int((c as! SignUpLocationCollectionViewCell).stateText.text ?? "0")
                self.city     = (c as! SignUpLocationCollectionViewCell).cityText.text
                self.address  = ((c as! SignUpLocationCollectionViewCell).addressText.text ?? "") + ((c as! SignUpLocationCollectionViewCell).address2Text.text ?? "")
                self.cep      = (c as! SignUpLocationCollectionViewCell).cepText.text
            }
            break
        default:
            if let c = cell {
                self.brand           = (c as! SignUpPaymentCollectionViewCell).flagText.text
                self.number          = (c as! SignUpPaymentCollectionViewCell).numberText.text
                self.expirationMonth = Int((c as! SignUpPaymentCollectionViewCell).expirationText.text ?? "0")
                self.expirationYear  = Int((c as! SignUpPaymentCollectionViewCell).expirationYear.text ?? "0")
                self.cvv             = Int((c as! SignUpPaymentCollectionViewCell).cvvText.text ?? "0")
                self.number          = (c as! SignUpPaymentCollectionViewCell).nameText.text
                if (c as! SignUpPaymentCollectionViewCell).passwordText.text == (c as! SignUpPaymentCollectionViewCell).password2Text.text {
                    self.password = (c as! SignUpPaymentCollectionViewCell).passwordText.text
                }
            }
            break
        }
    }
    
}

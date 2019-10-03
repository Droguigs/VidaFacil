//
//  UITableViewCell+Identifiable.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 29/03/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}

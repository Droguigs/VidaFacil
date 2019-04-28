//
//  AlertButtonAction.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

enum AlertButtonStyle {
    case `default`
    case destructive
    case cancel
}

struct AlertButtonAction {
    
    let title: String
    let style: AlertButtonStyle
    var completion: (() -> ())?
    
}

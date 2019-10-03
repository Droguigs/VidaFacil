//
//  RootApiModel.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

protocol RootApiModel: Mappable {
    
    var error: Error? { get set }
    
}

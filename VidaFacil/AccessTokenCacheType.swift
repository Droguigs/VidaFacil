//
//  AccessTokenCacheType.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

protocol AccessTokenCacheType {
    
    func accessToken() -> String?
    func update(token: String?)
    
}

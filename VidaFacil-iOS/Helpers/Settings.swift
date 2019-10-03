//
//  Settings.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 09/09/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Settings {
    
    var lockMessagesPeriod: Int!
    var iOSVersion: String!
    
}

extension Settings: Mappable {
    
    init?(map: Map) {
        
        if map.JSON["lock_messages_period"] == nil {
            return nil
        }
    }
    
    mutating func mapping(map: Map) {
        lockMessagesPeriod  <- map["lock_messages_period"]
        iOSVersion          <- map["iOS_VERSION"]
    }
    
}

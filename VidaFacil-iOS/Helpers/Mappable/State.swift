//
//  State.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct State {
    
    var id: Int!
    var uf: String!
    var description: String!
    
}

extension State: Mappable {
    
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        id          <- map["id"]
        uf          <- map["uf"]
        description <- map["description"]
    }
    
}

//
//  EstablishmentType.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 25/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct EstablishmentType {
    var id: Int!
    var description: String!
    var type: String!
    var active: Bool!
    var createdAt: String!
    var updatedAt: String!
    var pivot: Pivot!
}

extension EstablishmentType: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        id          <- map["id"]
        description <- map["description"]
        type        <- map["type"]
        active      <- map["active"]
        createdAt   <- map["created_at"]
        updatedAt   <- map["updated_at"]
        pivot       <- map["pivot"]
    }
}

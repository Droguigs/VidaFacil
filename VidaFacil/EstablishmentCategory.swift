//
//  EstablishmentCategory.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct EstablishmentCategory {
    var id: Int!
    var name: String!
    var icon: String?
    var active: Bool?
    var establishmentsCount: Int?
}

extension EstablishmentCategory: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        icon                <- map["icon"]
        active              <- map["active"]
        establishmentsCount <- map["count_establisments"]
    }
}

extension EstablishmentCategory: Equatable {
    static func ==(lhs: EstablishmentCategory, rhs: EstablishmentCategory) -> Bool {
        return lhs.id == rhs.id
    }
}

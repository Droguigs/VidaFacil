//
//  DiscountType.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct DiscountType {
    var id: Int!
    var description: String!
}

extension DiscountType: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        id          <- map["id"]
        description <- map["descriprion"]
    }
}

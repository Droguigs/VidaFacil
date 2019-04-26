//
//  Products.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Products {
    var data: [Product]
}

extension Products: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}

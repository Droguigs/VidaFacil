//
//  Establishments.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Establishments {
    var data: [Establishment]
}

extension Establishments: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}

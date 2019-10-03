//
//  StarAverage.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 09/09/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct StarAverage: Mappable {
    var average: Int!
    var totalRatings: Int!
}

extension StarAverage {
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        average      <- map["average"]
        totalRatings <- map["total_ratings"]
    }
}

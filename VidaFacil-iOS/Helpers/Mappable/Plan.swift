//
//  Plan.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Plan {
    var id: Int!
    var description: String!
    var benefits: [Benefit]!
    var value: String!
    var maxAggregates: Int!
    var active: Bool!
}

extension Plan: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        id              <- map["id"]
        description     <- map["description"]
        benefits        <- map["benefits"]
        value           <- map["value"]
        maxAggregates   <- map["max_aggregates"]
        active          <- map["active"]
    }
}

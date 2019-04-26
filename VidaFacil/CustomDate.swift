//
//  CustomDate.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct CustomDate {
    var date: String!
    var timezoneType: Int!
    var timezone: String!
}

extension CustomDate: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        date         <- map["date"]
        timezoneType <- map["timezone_type"]
        timezone     <- map["timezone"]
    }
}

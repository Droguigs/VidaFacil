//
//  DiscountTypes.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct DiscountTypes: RootApiModel {
    var error: Error?
    var data: [DiscountType]?
}

extension DiscountTypes: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        error = map.mapApiError()
        data <- map["data"]
    }
}

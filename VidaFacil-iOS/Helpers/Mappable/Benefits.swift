//
//  Benefits.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Benefits: RootApiModel {
    var error: Error?
    var data: [Benefit]?
}

extension Benefits: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        error = map.mapApiError()
        data <- map["data"]
    }
}

//
//  EstablishmentCategories.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 08/10/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct EstablishmentCategories: RootApiModel {
    var error: Error?
    var data: [Establishment]?
}

extension EstablishmentCategories: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        error = map.mapApiError()
        data <- map["data"]
    }
}

//
//  QRResult.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 15/10/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct QRResult: RootApiModel {
    var error: Error?
}

extension QRResult: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        error = map.mapApiError()
    }
}

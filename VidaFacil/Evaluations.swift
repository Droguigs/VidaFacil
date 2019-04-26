//
//  Evaluations.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 25/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Evaluations {
    var data: [Evaluation]
}

extension Evaluations: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}

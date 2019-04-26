//
//  Pivot.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 25/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Pivot {
    var evaluationId: Int!
    var evaluationTypeId: Int!
}

extension Pivot: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        evaluationId     <- map["evaluation_id"]
        evaluationTypeId <- map["evaluation_type_id"]
    }
}

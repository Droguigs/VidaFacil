//
//  Evaluation.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 25/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Evaluation {
    var id: Int!
    var evaluation: Int!
    var evaluationType: EstablishmentType!
    var establishment: Establishment!
    var user: Bool!
    var text: Int!
}

extension Evaluation: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        id              <- map["id"]
        evaluation      <- map["evaluation"]
        evaluationType  <- map["evaluation_type"]
        establishment   <- map["establishment"]
        user            <- map["value"]
        text            <- map["form_payment"]
    }
}

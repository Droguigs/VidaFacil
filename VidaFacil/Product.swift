//
//  Product.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 25/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Product {
    var id: Int!
    var description: String!
    var discount: String!
    var discountType: DiscountType!
    var establishment: Establishment!
    var active: Bool!
    var value: Int!
    var paymentForm: String!
}

extension Product: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        id              <- map["id"]
        description     <- map["description"]
        discount        <- map["discount"]
        discountType    <- map["discount_type"]
        establishment   <- map["establishment"]
        active          <- map["active"]
        value           <- map["value"]
        paymentForm     <- map["form_payment"]
    }
}

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
    var discountTypeId: Int!
    var establishmentId: Int!
    var active: Bool!
    var value: Int!
    var paymentForm: String!
    var discountType: DiscountType!
}

extension Product: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        id              <- map ["id"]
        description     <- map ["description"]
        discount        <- map ["discount"]
        discountTypeId  <- map ["discount_type_id"]
        discountType    <- map ["discount_type"]
        establishmentId <- map ["establishment_id"]
        active          <- map ["active"]
        value           <- map ["value"]
        paymentForm     <- map ["form_payment"]
    }
}

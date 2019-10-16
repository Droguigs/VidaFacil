//
//  Establishment.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct Establishment {
    var id: Int!
    var description: String!
    var category: EstablishmentCategory!
    var cep: String!
    var state: State!
    var city: String!
    var neighborhood: String!
    var address: String!
    var phone: String!
    var latitude: String!
    var longitude: String!
    var image: String!
    var qrCode: String!
    var active: Bool!
    var productsCount: Int!
    var products: [Product]!
    var evaluations: [Any]!
    var average: StarAverage!
}

extension Establishment: Mappable {
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        id              <- map ["id"]
        description     <- map ["description"]
        category        <- map ["category"]
        cep             <- map ["cep"]
        state           <- map ["state"]
        city            <- map ["city"]
        neighborhood    <- map ["neighborhood"]
        address         <- map ["address"]
        phone           <- map ["phone"]
        latitude        <- map ["latitude"]
        longitude       <- map ["longitude"]
        image           <- map ["image"]
        qrCode          <- map ["qr_code"]
        active          <- map ["active"]
        productsCount   <- map ["count_products"]
        products        <- map ["products"]
        evaluations     <- map ["evaluations"]
        average         <- map ["stars"]
    }
}

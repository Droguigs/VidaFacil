//
//  User.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 24/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct User {
    var id: Int!
    var name: String!
    var email: String!
    var cpf: String!
    var cep: String!
    var state: State!
    var city: String!
    var neighborhood: String!
    var address: String!
    var phone: String!
    var birthday: String!
    var photo: String!
    var active: Bool!
    var createdAt: CustomDate!
    var updatedAt: CustomDate!
}

extension User: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        id           <- map["id"]
        name         <- map["name"]
        email        <- map["email"]
        cpf          <- map["cpf"]
        cep          <- map["cep"]
        state        <- map["state"]
        city         <- map["city"]
        neighborhood <- map["neighborhood"]
        address      <- map["address"]
        phone        <- map["phone"]
        birthday     <- map["birthday"]
        photo        <- map["photo"]
        active       <- map["active"]
        createdAt    <- map["created_at"]
        updatedAt    <- map["updated_at"]
    }
}

//
//  LoginResult.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct LoginResult: RootApiModel {
    var error: Error?
    var token: String?
    var tokenType: String?
    var expiresIn: Int?
}

extension LoginResult: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        error      = map.mapApiError()
        token     <- map["access_token"]
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
    }
}

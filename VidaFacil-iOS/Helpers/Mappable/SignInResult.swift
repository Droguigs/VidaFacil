//
//  SignInResult.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 16/10/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

struct SignInResult: RootApiModel {
    var error: Error?
}

extension SignInResult: Mappable {
    init?(map: Map) { }
    mutating func mapping(map: Map) {
        error = map.mapApiError()
    }
}

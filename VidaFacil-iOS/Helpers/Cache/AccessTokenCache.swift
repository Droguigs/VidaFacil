//
//  AccessTokenCache.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

private extension UserDefaultsKey {
    
    static var accessTokenKey: Key<String> {
        return "accessTokenKey"
    }
    
}

class AccessTokenCache: AccessTokenCacheType {
    
    private let userDefault: UserDefaultsServiceType
    
    init() {
        let customUserDefault = UserDefaults(suiteName: "access_token_preferences")
        self.userDefault = UserDefaultsService(customUserDefault: customUserDefault)
    }
    
    func accessToken() -> String? {
        return self.userDefault.value(forKey: .accessTokenKey)
    }
    
    func update(token: String?) {
        self.userDefault.set(value: token, forKey: .accessTokenKey)
    }
    
}

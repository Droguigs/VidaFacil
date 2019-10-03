//
//  LoginCache.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 08/09/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

private extension UserDefaultsKey {
    static var usernameKey: Key<String> {
        return "username"
    }
    static var passwordlKey: Key<String> {
        return "password"
    }
}

class LoginCache: LoginCacheType {
    
    private let userDefault: UserDefaultsServiceType
    
    var username: String? {
        get {
            if let userDefaultValue = self.userDefault.value(forKey: .usernameKey) {
                return userDefaultValue
            }
            return nil
        }
        set {
            self.userDefault.set(value: newValue, forKey: .usernameKey)
        }
    }
    
    var password: String? {
        get {
            if let userDefaultValue = self.userDefault.value(forKey: .passwordlKey) {
                return userDefaultValue
            }
            return nil
        }
        set {
            self.userDefault.set(value: newValue, forKey: .passwordlKey)
        }
    }
    
    init() {
        let customUserDefault = UserDefaults(suiteName: "login")
        self.userDefault = UserDefaultsService(customUserDefault: customUserDefault)
    }
}

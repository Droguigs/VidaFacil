//
//  UserCache.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation
import RealmSwift

private extension UserDefaultsKey {
    static var userKey: Key<String> {
        return "user"
    }
}

class UserCache: UserCacheType {
    
    private let userDefault: UserDefaultsServiceType
    
    var user: User? {
        get {
            var value: User? = nil
            if let userDefaultValue = self.userDefault.value(forKey: .userKey) {
                value = User(JSONString: userDefaultValue)
            }
            return value
        }
        
        set {
            self.userDefault.set(value: newValue?.toJSONString(), forKey: .userKey)
        }
    }
    
    init() {
        let customUserDefault = UserDefaults(suiteName: "user")
        self.userDefault = UserDefaultsService(customUserDefault: customUserDefault)
    }
    
}

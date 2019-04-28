//
//  UserDefaultsService.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

final class UserDefaultsService: UserDefaultsServiceType {
    
    private var customUserDefault: UserDefaults?
    
    init(customUserDefault: UserDefaults?) {
        self.customUserDefault = customUserDefault
    }
    
    private var defaults: UserDefaults {
        if let custom = self.customUserDefault {
            return custom
        }
        return UserDefaults.standard
    }
    
    func value<T>(forKey key: UserDefaultsKey<T>) -> T? {
        return self.defaults.value(forKey: key.key) as? T
    }
    
    func set<T>(value: T?, forKey key: UserDefaultsKey<T>) {
        self.defaults.set(value, forKey: key.key)
    }
}

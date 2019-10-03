//
//  SettingsCache.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 08/09/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

private extension UserDefaultsKey {
    static var settingsKey: Key<String> {
        return "settings"
    }
}

class SettingsCache: SettingsCacheType {
    
    private let userDefault: UserDefaultsServiceType
    
    var settings: Settings? {
        get {
            var value: Settings? = nil
            if let userDefaultValue = self.userDefault.value(forKey: .settingsKey) {
                value = Settings(JSONString: userDefaultValue)
            }
            return value
        }
        
        set {
            self.userDefault.set(value: newValue?.toJSONString(), forKey: .settingsKey)
        }
    }
    
    init() {
        let customUserDefault = UserDefaults(suiteName: "settings")
        self.userDefault = UserDefaultsService(customUserDefault: customUserDefault)
    }
    
}

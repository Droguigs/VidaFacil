//
//  GeneralCache.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 08/09/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

private extension UserDefaultsKey {
    
    static var isFirstAccessKey: Key<Bool> {
        return "is_first_access"
    }
    static var isFirstUsingDayKey: Key<String> {
        return "is_first_using_day"
    }
}

class GeneralCache: GeneralCacheType {
    
    private let userDefault: UserDefaultsServiceType
    
    var isFirstAccess: Bool {
        get {
            var value: Bool = true
            if let userDefaultValue = self.userDefault.value(forKey: .isFirstAccessKey) {
                value = userDefaultValue
            }
            return value
        }
        set {
            self.userDefault.set(value: newValue, forKey: .isFirstAccessKey)
        }
    }
    
    var isFirstUsingDay: Date = Date()
//    {
//        get {
//            var value: Date = Date()
//            if let userDefaultValue = self.userDefault.value(forKey: .isFirstUsingDayKey) {
//                if let dt = userDefaultValue.toDate() {
//                    value = dt
//                }
//            }
//            return value
//        }
//        set {
//            self.userDefault.set(value: newValue.toApiFormat(), forKey: .isFirstUsingDayKey)
//        }
//    }
    
    init() {
        let customUserDefault = UserDefaults(suiteName: "general")
        self.userDefault = UserDefaultsService(customUserDefault: customUserDefault)
    }
}

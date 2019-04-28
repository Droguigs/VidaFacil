//
//  ServicesManager.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation
import Moya

class ServicesManager {
    
    static let sharedInstance = ServicesManager()
    
    let accessTokenCache: AccessTokenCacheType!
    let api: ApiServiceType!
    let userCache: UserCacheType!
    
    init() {
        let tokenCache = AccessTokenCache()
        let tokenPlugin = AccessTokenPlugin(tokenCache: tokenCache)
        let moya = MoyaProvider<VidaFacilAPI>(manager: TimeoutManager.sharedManager, plugins: [tokenPlugin])
        self.userCache = UserCache()
        self.accessTokenCache = tokenCache
        self.api = ApiService(api: moya, accessTokenCache: accessTokenCache)
    }
}

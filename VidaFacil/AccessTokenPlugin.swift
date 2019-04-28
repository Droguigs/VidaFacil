//
//  AccessTokenPlugin.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Moya

struct AccessTokenPlugin: PluginType {
    
    private let tokenCache: AccessTokenCacheType
    
    init(tokenCache: AccessTokenCacheType) {
        self.tokenCache = tokenCache
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let authorizable = target as? AccessTokenAuthorizable {
            let type: Moya.AuthorizationType = authorizable.authorizationType
            if type.value != Moya.AuthorizationType.bearer.value {
                return request
            }
        }
        
        var handledRequest = request
        if let token = self.tokenCache.accessToken() {
            handledRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        return handledRequest
    }
    
}

//
//  TimeoutManager.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation
import Alamofire

class TimeoutManager: Alamofire.SessionManager {
    static let sharedManager: TimeoutManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 60
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return TimeoutManager(configuration: configuration)
    }()
}

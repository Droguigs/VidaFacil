//
//  APIError.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

enum ApiError: Error {
    
    case invalidCredentials
    case tokenExpired
    case tokenNotProvided
    case updateImageIsRequired
    case custom(message: String)
    case unknown
    
    var rawValue : Int {
        get {
            switch self {
            case .invalidCredentials : return 0
            case .tokenExpired : return 1
            case .tokenNotProvided : return 2
            case .updateImageIsRequired : return 3
            case .custom(message: _) : return 4
            case .unknown : return 5
            }
        }
    }
}

func ==(lhs:ApiError,rhs:ApiError) -> Bool {
    
    return (lhs.rawValue == rhs.rawValue)
    
}

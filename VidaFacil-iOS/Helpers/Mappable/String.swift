//
//  String+toApiError.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

extension String {
    
    func toApiError() -> ApiError {
        switch self {
        case "invalid_credentials":
            return .invalidCredentials
        case "token_not_provided":
            return .tokenNotProvided
        case "token_expired":
            return .tokenExpired
        case "You need to send a image to edit the user.":
            return .updateImageIsRequired
        default:
            return .custom(message: self)
        }
    }
    
    func toUrl(_ urlString: String = "") -> URL? {
        guard let url = URL(string: self) else {
            return nil
        }
        return url
    }
    
}

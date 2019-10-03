//
//  Map+Error.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import ObjectMapper

extension Map {
    
    func hasError() -> Bool {
        return self.JSON["error"] != nil
    }
    
    func mapApiError() -> ApiError? {
        if let errorString: String = self.JSON["error"] as? String {
            return errorString.toApiError()
        }
        return nil
    }
    
}

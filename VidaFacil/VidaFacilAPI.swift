//
//  VidaFacilAPI.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 14/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Moya

enum VidaFacilAPI {
    
//    case dashboard(groupId: Int)
    
}

extension VidaFacilAPI: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: "https://vidafacilapp.com.br/api")!
    }
    
    var path: String {
        switch self {
//        case let .dashboard(groupId):
//            return "/timeline/\(groupId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
//        case .dashboard:
//            return .get
//        case .dashboardDislike,
//             .dashboardLike,
//             .dashboardPost,
//             .newManagement,
//             .forgotPassword,
//             .addImage,
//             .searchUser,
//             .newEvent,
//             .login,
//             .newFiles,
//             .newWatch,
//             .sendMessage,
//             .newMessageGroup,
//             .deviceIdUpdate,
//             .setMyClient,
//             .userUpdate:
//            return .post
//        case .deleteImage,
//             .deleteFiles,
//             .deleteEvent,
//             .deleteWatch,
//             .deleteManagement,
//             .dashboardDelete:
//            return .delete
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
//        case .forgotPassword,
//             .login:
//            return .none
        default:
            return .bearer
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    
}

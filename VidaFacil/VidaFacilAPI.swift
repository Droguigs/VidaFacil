//
//  VidaFacilAPI.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 14/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Moya

enum VidaFacilAPI {
    
    case benefits(benefitId: Int?)
    case categories(categoryId: Int?)
    case discountTypes(discountTypeId: Int?)
    case establishments(establishmentId: Int?, categoryId: Int?, latitude: String?, longitude: String?)
    case evaluations(evaluationId: Int?, evaluationType: String?)
    case login(user: String, password: String)
    case plans(planId: Int?)
    case products(productId: Int?)
    case states(stateId: Int?)
    case users(userId: Int?)
    
}

extension VidaFacilAPI: TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: "https://vidafacilapp.com.br/api")!
    }
    
    var path: String {
        switch self {
        case let .benefits(benefitId):
            if let id = benefitId {
                return "/benefits/\(id)"
            }
            return "/benefits"
        case let .categories(categoryId):
            if let id = categoryId {
                return "/categories/\(id)"
            }
            return "/categories"
        case let .discountTypes(discountTypeId):
            if let id = discountTypeId {
                return "/discount-types/\(id)"
            }
            return "/discount-types"
        case let .establishments(establishmentId, categoryId, latitude, longitude):
            if let id = establishmentId {
                return "/establishments/\(id)"
            } else if let id = categoryId,
                let lat = latitude,
                let lon = longitude {
                return "/establishments/\(id)/categories/\(lat)/\(lon)"
            }
            return "/establishments"
        case let .evaluations(evaluationId, evaluationType):
            if let id = evaluationId {
                return "/evaluations/\(id)"
            } else if let type = evaluationType {
                return "/evaluations/category/\(type)"
            }
            return "/evaluations"
        case .login:
            return "/auth/login"
        case let .plans(planId):
            if let id = planId {
                return "/plans/\(id)"
            }
            return "/plans"
        case let .products(productId):
            if let id = productId {
                return "/products/\(id)"
            }
            return "/products"
        case let .states(stateId):
            if let id = stateId {
                return "/states/\(id)"
            }
            return "/states"
        case let .users(userId):
            if let id = userId {
                return "/users/\(id)"
            }
            return "/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .benefits,
             .categories,
             .discountTypes,
             .establishments,
             .evaluations,
             .plans,
             .products,
             .states,
             .users:
            return .get
        case .login:
            return .post
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
            
        case let .login(user, password):
            return .requestParameters(parameters: ["email" : user, "password" : password], encoding: JSONEncoding.default)
        
//            case let .addImage(groups,
//            images,
//            description):
//
//            let desc: String = description ?? ""
//            let params: [String:Any] = ["groups" : groups,
//                                        "description" : desc,
//                                        "type" : 0]
//
//            var multipart: [MultipartFormData] = []
//            var counter = 0
//            for image in images {
//            multipart.append(MultipartFormData(provider: .data(image), name: "images[\(counter)]", fileName: "image.png", mimeType: "image/png"))
//            counter+=1
//            }
//            return .uploadCompositeMultipart(multipart, urlParameters: params)
            
        default:
            return .requestPlain
        }
    }
    
    
    var authorizationType: AuthorizationType {
        switch self {
        case .login:
            return .none
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

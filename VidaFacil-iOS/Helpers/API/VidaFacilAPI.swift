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
    case establishments(establishmentId: Int?)
    case establishmentsCategory(categoryId: Int?, latitude: String?, longitude: String?)
    case evaluations(evaluationId: Int?, evaluationType: String?)
    case login(user: String, password: String)
    case plans(planId: Int?)
    case products(productId: Int?)
    case qr(qrCode: String!, productId: Int!)
    case signUp(data: SignUpData!)
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
        case let .establishments(establishmentId):
            if let id = establishmentId {
                return "/establishments/\(id)"
            }
            return "/establishments"
        case let .establishmentsCategory(categoryId, latitude, longitude):
            if let id = categoryId,
                let lat = latitude,
                let lon = longitude {
                return "/establishments/\(id)/category/\(lat)/\(lon)"
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
        case .qr:
            return "/qr-code"
        case .signUp:
            return "/users"
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
             .establishmentsCategory,
             .evaluations,
             .plans,
             .products,
             .qr,
             .states,
             .users:
            return .get
        case .login,
             .signUp:
            return .post
//        case .deleteImage,
//             .dashboardDelete:
//            return .delete
        }
    }
    
    var task: Task {
        switch self {
            
        case let .login(user, password):
            return .requestParameters(parameters: ["email" : user, "password" : password], encoding: JSONEncoding.default)
        case let .qr(qrCode, productId):
            return .requestParameters(parameters: ["qr_code" : qrCode ?? "", "product_id" : productId ?? 0], encoding: JSONEncoding.default)
        case let .signUp(data):
            let params: [String: Any] = ["name" : data?.name ?? "",
                                         "email" : data?.email ?? "",
                                         "password" : data?.password ?? "",
                                         "cpf" : data?.cpf ?? "",
                                         "cep" : data?.cep ?? "",
                                         "state_id" : data?.stateId ?? "",
                                         "city" : data?.city ?? "",
                                         "nighborhood" : data?.neighborhood ?? "",
                                         "address" : data?.address ?? "",
                                         "phone" : data?.phone ?? "",
                                         "birthday" : data?.birthday ?? "",
                                         "active" : data?.active ?? "",
                                         "number" : data?.number ?? "",
                                         "holder" : data?.holder ?? "",
                                         "expiryMonth" : data?.expirationMonth ?? "",
                                         "expiryYear" : data?.expirationYear ?? "",
                                         "cvv" : data?.cvv ?? "",
                                         "brand" : data?.brand ?? ""]
            if let image = data?.photo {
                return .uploadCompositeMultipart([MultipartFormData(provider: .data(image), name: "profile_image", fileName: "profile_image.png", mimeType: "profile_image/png")], urlParameters: params)
            }
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    
    var authorizationType: AuthorizationType {
        switch self {
        case .categories,
             .establishments,
             .establishmentsCategory,
             .login:
            return .none
        default:
            return .bearer
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    
    
}

//
//  APIService.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//
import Moya
import Result
import Moya_ObjectMapper
import ObjectMapper

class ApiService: ApiServiceType {
    
    private let api: MoyaProvider<VidaFacilAPI>
    private var accessTokenCache: AccessTokenCacheType
    
    init(api: MoyaProvider<VidaFacilAPI>, accessTokenCache: AccessTokenCacheType) {
        self.api = api
        self.accessTokenCache = accessTokenCache
    }
    
    func categories(categoryId: Int?, completion: @escaping (Categories?, Error?) -> ()) {
        self.api.request(.categories(categoryId: categoryId)) { [weak self] result in
            self?.noTokenParse(result, type: Categories.self, completion: { (result, error) in
                if let _error = error {
                    completion(nil, _error)
                } else if let _result = result {
                    completion(_result, nil)
                }
            })
        }
    }
    
    func establishments(establishmentId: Int?, categoryId: Int?, latitude: String?, longitude: String?, completion: @escaping (Establishments?, Error?) -> ()) {
        self.api.request(.establishments(establishmentId: establishmentId,
                                         categoryId: categoryId,
                                         latitude: latitude,
                                         longitude: longitude)) { [weak self] result in
            self?.parse(result, type: Establishments.self, completion: completion, tokenExpired: {})
        }
    }
    
    func login(user: String, password: String, completion: @escaping (LoginResult?, Error?) -> ()) {
        self.api.request(.login(user: user, password: password)) { [weak self] result in
            self?.parse(result, type: LoginResult.self, completion: completion, tokenExpired: {})
        }
    }
    
    // MARK: - Parsing
    private func noTokenParse<T: Mappable>(_ result: Result<Moya.Response, MoyaError>, type: T.Type, completion:(T? , Error?) -> ()) {
        switch result {
        case let .success(response):
            do {
                let parsed: T = try response.mapObject(type)
                completion(parsed, nil)
            } catch {
                completion(nil, error)
            }
        case let .failure(error):
            completion(nil, error)
        }
    }
    
    private func parse<T: RootApiModel>(_ result: Result<Moya.Response, MoyaError>, type: T.Type, completion:(T? , Error?) -> (), tokenExpired: () -> ()) {
        switch result {
        case let .success(response):
            do {
                let parsed: T = try response.mapObject(type)
                if let e = parsed.error {
                    if e is ApiError {
                        let api = e as! ApiError
                        if api == ApiError.tokenExpired {
                            tokenExpired()
                            return
                        }
                    }
                    completion(nil, e)
                } else {
                    completion(parsed, nil)
                }
            } catch {
                completion(nil, error)
            }
        case let .failure(error):
            completion(nil, error)
        }
    }
    
    private func parseArray<T: Mappable>(_ result: Result<Moya.Response, MoyaError>, type: T.Type, completion:([T]? , Error?) -> ()) {
        switch result {
        case let .success(response):
            do {
                let parsed: [T] = try response.mapArray(type)
                completion(parsed, nil)
            } catch {
                completion(nil, error)
            }
        case let .failure(error):
            completion(nil, error)
        }
    }
    
}


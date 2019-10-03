//
//  APIServiceType.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation

typealias Completion<T: RootApiModel> = (T?, Error?) -> ()

protocol ApiServiceType {
    
    func categories(categoryId: Int?, completion: @escaping Completion<Categories>)
    func establishments(establishmentId: Int?, categoryId: Int?, latitude: String?, longitude: String?, completion: @escaping Completion<Establishments>)
    func login(user: String, password: String, completion: @escaping Completion<LoginResult>)
    
}

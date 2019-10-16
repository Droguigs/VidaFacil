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
    
    func benefits(benefitId: Int?, completion: @escaping Completion<Benefits>)
    func categories(categoryId: Int?, completion: @escaping Completion<Categories>)
    func discountTypes(discountTypeId: Int?, completion: @escaping Completion<DiscountTypes>)
    func establishments(establishmentId: Int?, completion: @escaping Completion<Establishments>)
    func establishmentCategory(categoryId: Int?, latitude: String?, longitude: String?, completion: @escaping Completion<EstablishmentCategories>)
    func evaluations(evaluationId: Int?, evaluationType: String?, completion: @escaping Completion<Evaluations>)
    func login(user: String, password: String, completion: @escaping Completion<LoginResult>)
    func plans(planId: Int?, completion: @escaping Completion<Plans>)
    func products(productId: Int?, completion: @escaping Completion<Products>)
    func qr(qrCode: String!, productId: Int!, completion: @escaping Completion<QRResult>)
    func states(stateId: Int?, completion: @escaping Completion<States>)
    func users(userId: Int?, completion: @escaping Completion<Users>)
    
}

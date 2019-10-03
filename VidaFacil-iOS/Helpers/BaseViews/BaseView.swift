//
//  BaseView.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

protocol BaseView: class {
    
    func showLoading()
    func stopLoading()
    func showError(_ error: Error)
    func showMessage(_ message: String)
}

class BaseViewModel {
    
    var indexPath: IndexPath? = nil
    
}

class BaseViewController: UIViewController, BaseView {
    
    func showLoading() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func stopLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showError(_ error: Error) {
        var errorMessage = ""
        
        switch (error) {
        case ApiError.custom(let message):
            errorMessage = message
            break
        default:
            errorMessage = "Ocorreu uma falha na sua solicitação."
            break
        }
        
        AlertBuilder(
            message: errorMessage
            ).add(button: AlertButtonAction(
                title: "OK",
                style: .default,
                completion: nil)
            ).show(controller: self, animated: true)
    }
    
    func showMessage(_ message: String) {
        AlertBuilder(
            message: message
            ).add(button: AlertButtonAction(
                title: "OK",
                style: .default,
                completion: nil)
            ).show(controller: self, animated: true)
    }
}

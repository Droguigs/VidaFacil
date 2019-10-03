//
//  LoginViewController.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 28/07/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func loginAsUser(_ sender: Any) {
        #warning("Set up auto Login(?)")
        self.showLoading()
        if let user = loginText.text {
            if let password = passwordText.text {
                ServicesManager.sharedInstance.api.login(user: user, password: password) { (result, error) in
                    
                    let accessTokenCache = AccessTokenCache()
                    var userCache: UserCacheType
                    var generalCache = GeneralCache()
                    let loginCache = LoginCache()
                    
                    self.stopLoading()
                    if let _error = error {
                        self.showError(_error)
                        print(_error)
                    } else if let login = result {
                        loginCache.username = user
                        loginCache.password = password
                        
                        accessTokenCache.update(token: login.token)
                        
                        self.performSegue(withIdentifier: "Login-Main", sender: self)
//                        userCache.user = user
//
//                        if var _cache = generalCache {
//                            if _cache.isFirstAccess {
//                                _cache.isFirstUsingDay = Date()
//                            } else {
//
//                            }
//                        } else {
//                            self.showError(ApiError.unknown)
//                        }
                    } else {
                        self.showError(ApiError.unknown)
                    }
                }
            } else {
                
            }
        } else {
            
        }
    }
    
    @IBAction func loginAsGuest(_ sender: Any) {
        performSegue(withIdentifier: "Login-Main", sender: self)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
    }
    
}

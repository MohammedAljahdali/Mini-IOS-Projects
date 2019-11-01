//
//  LoginViewController.swift
//  TheMovieManager
//
//  Created by Owen LaRosa on 8/13/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginViaWebsiteButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        TMDBClient.requestToken(completion: requestTokenCompletionHandler(success:error:))
    }
    
    @IBAction func loginViaWebsiteTapped() {
        TMDBClient.requestToken(completion: webAuthHandler(success:error:))
    }
    
    func requestTokenCompletionHandler(success: Bool, error: Error?) {
        if success {
            print(TMDBClient.Auth.requestToken)
            DispatchQueue.main.async {
                TMDBClient.login(completion: self.requestLoginCompletionHandler(success:error:), username: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "")
            }
        }
    }
    
    func requestLoginCompletionHandler(success: Bool, error: Error?) {
        if success {
            print(TMDBClient.Auth.requestToken)
            TMDBClient.createSession(completion: self.sessionHandler(success:error:))
        }
    }
    func sessionHandler(success: Bool, error: Error?) {
        if success {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "completeLogin", sender: nil)
            }
        }
    }
    func webAuthHandler(success: Bool, error: Error?) {
        if success {
            DispatchQueue.main.async {
            UIApplication.shared.open(TMDBClient.Endpoints.webAuth.url, options: [:], completionHandler: nil)
            }
        }
    }
        
}

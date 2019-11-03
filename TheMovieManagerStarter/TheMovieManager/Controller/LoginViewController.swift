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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        isLoggingIn(true)
        TMDBClient.requestToken(completion: requestTokenCompletionHandler(success:error:))
    }
    
    @IBAction func loginViaWebsiteTapped() {
        isLoggingIn(true)
        TMDBClient.requestToken(completion: webAuthHandler(success:error:))
    }
    
    func requestTokenCompletionHandler(success: Bool, error: Error?) {
        if success {
            print(TMDBClient.Auth.requestToken)
            TMDBClient.login(completion: self.requestLoginCompletionHandler(success:error:), username: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "")
        } else {
            showLoginFailure(message: error?.localizedDescription ?? "")
        }
        
    }
    
    func requestLoginCompletionHandler(success: Bool, error: Error?) {
        if success {
            isLoggingIn(false)
            print(TMDBClient.Auth.requestToken)
            TMDBClient.createSession(completion: self.sessionHandler(success:error:))
        } else {
            isLoggingIn(false)
            showLoginFailure(message: error?.localizedDescription ?? "")
        }
        
    }
    func showLoginFailure(message: String) {
        let alertVC = UIAlertController(title: "Login Failed", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        show(alertVC, sender: nil)
    }
    
    func sessionHandler(success: Bool, error: Error?) {
        if success {
            self.performSegue(withIdentifier: "completeLogin", sender: nil)
        } else {
            showLoginFailure(message: error?.localizedDescription ?? "")
        }
    }
    
    func webAuthHandler(success: Bool, error: Error?) {
        if success {
            DispatchQueue.main.async {
            UIApplication.shared.open(TMDBClient.Endpoints.webAuth.url, options: [:], completionHandler: nil)
            }
        } else {
            showLoginFailure(message: error?.localizedDescription ?? "")
        }
    }
    
    func isLoggingIn(_ isLogging: Bool) {
        if isLogging {
            activityIndicator.startAnimating()
            loginButton.isEnabled = false
            loginViaWebsiteButton.isEnabled = false
            emailTextField.isEnabled = false
            passwordTextField.isEnabled = false
        } else {
            activityIndicator.stopAnimating()
            loginButton.isEnabled = true
            loginViaWebsiteButton.isEnabled = true
            emailTextField.isEnabled = true
            passwordTextField.isEnabled = true
            
        }
    }
        
}

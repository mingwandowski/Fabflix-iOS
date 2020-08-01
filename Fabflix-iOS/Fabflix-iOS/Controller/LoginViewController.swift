//
//  LoginViewController.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/26/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let login = LoginModel()

    override func viewWillAppear(_ animated: Bool) {
        
        // set the status bar color to white?
        self.navigationController?.navigationBar.barStyle = .black
        
        // set the navigationBar transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        login.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension LoginViewController: LoginDelegate {
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        loginAuth()
    }
    
    func loginAuth() {
        login.authorize(withEmail: emailTextField.text!, andPassword: passwordTextField.text!)
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    func updateStatus(withStatus status: [String : Any]) {
        DispatchQueue.main.async {
            if status["status"] as? String ?? "fail" == "success" {
                self.performSegue(withIdentifier: "toSearchPage", sender: self)
            } else {
                let message = status["message"] as? String ?? "error"
                // create the alert
                let alert = UIAlertController(title: "Login Failed", message: message, preferredStyle: UIAlertController.Style.alert)

                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(emailTextField) {
            passwordTextField.becomeFirstResponder()
            return false
        } else {
            loginAuth()
            return true
        }
    }
}


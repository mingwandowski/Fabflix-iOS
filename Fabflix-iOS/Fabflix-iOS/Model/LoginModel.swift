//
//  Login.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/26/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import Foundation

protocol LoginDelegate {
    func updateStatus(withStatus status: [String: Any])
}

class LoginModel {
    
    let url = baseUrl + "api/login"
    
    var delegate: LoginDelegate?
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
    }
    
    func authorize(withEmail email: String, andPassword password: String) {
        
        // create post request
        let url = URL(string: self.url)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert data to the request
        let params = "email=\(email)&password=\(password)"
        request.httpBody = params.data(using: .utf8)!
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
                self.delegate?.updateStatus(withStatus: responseJSON)
            }
        }

        task.resume()
        
    }
    
}

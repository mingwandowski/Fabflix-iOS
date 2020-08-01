//
//  Extensions.swift
//  Fabflix-iOS
//
//  Created by Zidan Li on 7/26/20.
//  Copyright © 2020 Haoming Gao. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
//    hide the keyboard
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

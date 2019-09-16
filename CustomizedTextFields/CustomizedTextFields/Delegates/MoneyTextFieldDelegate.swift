//
//  MoneyTextFieldDelegate.swift
//  CustomizedTextFields
//
//  Created by Mohammed Khakidaljahdali on 15/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import Foundation
import UIKit

class MoneyTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    func cents(_ text: String) -> String {
        return "0.\(text)"
    }
    
}

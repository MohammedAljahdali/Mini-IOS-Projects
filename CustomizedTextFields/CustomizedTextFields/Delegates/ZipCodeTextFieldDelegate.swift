//
//  ZipCodeTextFieldDelegate.swift
//  CustomizedTextFields
//
//  Created by Mohammed Khakidaljahdali on 15/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText: NSString = textField.text! as NSString
        let newerText: NSString = newText.replacingCharacters(in: range, with: string) as NSString
        return newerText.length <= 5

    }
    
    
}

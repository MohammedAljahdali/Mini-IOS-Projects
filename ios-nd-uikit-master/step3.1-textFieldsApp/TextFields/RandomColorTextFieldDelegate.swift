//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Mohammed Khakidaljahdali on 14/09/2019.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    //    func randomColor() -> UIColor {
    //        // @TODO: return a random color
    //    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // @TODO: Set the color of your text here!
        return true
    }
    
}

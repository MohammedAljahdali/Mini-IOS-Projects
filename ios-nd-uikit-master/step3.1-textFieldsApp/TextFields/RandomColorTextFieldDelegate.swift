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
    
        func randomColor() -> UIColor {
            // @TODO: return a random color
            let colors: [UIColor] = [
            .blue, .black, .cyan, .gray, .orange, .purple, .green
            ]
            return colors[Int.random(in: 0..<colors.count)]
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // @TODO: Set the color of your text here!
//        var newText = textField.text! as NSString
//        newText = newText.replacingCharacters(in: range, with: string) as NSString
        textField.textColor = randomColor()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    
}

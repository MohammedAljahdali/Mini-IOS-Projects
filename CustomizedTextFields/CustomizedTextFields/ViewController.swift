//
//  ViewController.swift
//  CustomizedTextFields
//
//  Created by Mohammed Khakidaljahdali on 15/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchableTextField: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func textSwitch() {
        var textState: Bool = switchableTextField.isEnabled
        switchableTextField.isEnabled = !textState
    }
    
}


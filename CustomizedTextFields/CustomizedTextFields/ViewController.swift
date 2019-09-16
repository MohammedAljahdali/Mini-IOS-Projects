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
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var moneyTextField: UITextField!
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let moneyDelegate = MoneyTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        zipCodeTextField.delegate = zipCodeDelegate
        moneyTextField.delegate = moneyDelegate
        
    }

    @IBAction func textSwitch() {
        let textState: Bool = switchableTextField.isEnabled
        switchableTextField.isEnabled = !textState
    }
    
}


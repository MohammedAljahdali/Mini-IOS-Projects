//
//  ViewController.swift
//  StockViewExperiment
//
//  Created by Mohammed Khakidaljahdali on 12/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func experiment(sender: UIButton) {
        let nextController = UIImagePickerController()
        present(nextController, animated: true, completion: nil)
    }


}


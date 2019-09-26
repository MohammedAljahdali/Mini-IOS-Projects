//
//  EndViewController.swift
//  MakeYourAdv
//
//  Created by Mohammed Khakidaljahdali on 26/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
    }
    
    @objc func startOver() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    deinit {
        print("hello")
    }

}

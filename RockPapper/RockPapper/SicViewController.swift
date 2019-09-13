//
//  SicViewController.swift
//  RockPapper
//
//  Created by Mohammed Khakidaljahdali on 13/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit

class SicViewController: UIViewController {
    
    let value: Int = 2
    var choice: Int = 0
    @IBOutlet weak var outcome: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch choice {
        case 0:
           outcome.image = UIImage(named: "o1")
            label.text = "You Lost!"
        case 1:
            outcome.image = UIImage(named: "o2")
            label.text = "You Won!"
        case 2:
            outcome.image = UIImage(named: "o0")
            label.text = "It's a Tie!"
        default:
            print("error")
        }
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }


}

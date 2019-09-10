//
//  ViewController.swift
//  Click_Counter
//
//  Created by Mohammed Khakidaljahdali on 10/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Label
//        let label = UILabel()
//        label.frame = CGRect(x: 187, y: 418, width: 60, height: 60)
//        label.text = "0"
//        view.addSubview(label)
//        self.label = label
//
//        // Increment Button
//        let incrementButton = UIButton()
//        incrementButton.frame = CGRect(x: 177, y: 478, width: 120, height: 60)
//        incrementButton.setTitle("Increment", for: .normal)
//        incrementButton.setTitleColor(UIColor.blue, for: .normal)
//        view.addSubview(incrementButton)
//
//        incrementButton.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControl.Event.touchUpInside)
//
//        // Change Background color button
//        let changeColorButton = UIButton()
//        changeColorButton.frame = CGRect(x: 177, y: 538, width: 120, height: 60)
//        changeColorButton.setTitle("Change Color", for: .normal)
//        changeColorButton.setTitleColor(.purple, for: .normal)
//        view.addSubview(changeColorButton)
//
//        changeColorButton.addTarget(self, action: #selector(ViewController.changeBackground), for: .touchUpInside)
    }
    
    enum Colors {
        case gray, yellow, white, green, orange
    }
    var colorCounter = 0
    @IBAction func incrementCount() {
        self.count += 1
        self.label.text = "\(self.count)"
    }
    @IBAction func changeBackground() {
        switch colorCounter {
        case 0:
            view.backgroundColor = UIColor.gray
        case 1:
            view.backgroundColor = UIColor.yellow
        case 2:
            view.backgroundColor = UIColor.orange
        case 3:
            view.backgroundColor = UIColor.brown
        case 4:
            view.backgroundColor = UIColor.green
        case 5:
            view.backgroundColor = UIColor.white
        default:
            view.backgroundColor = UIColor.white
        }
        colorCounter += 1
        if colorCounter == 6 {
            colorCounter = 0
        }
        
    }
    
    
    


}


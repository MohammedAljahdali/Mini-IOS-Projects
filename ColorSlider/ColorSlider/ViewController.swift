//
//  ViewController.swift
//  ColorSlider
//
//  Created by Mohammed Khakidaljahdali on 11/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColor()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColor() {
        let r: Float = redSlider.value
        let g: Float = greenSlider.value
        let b: Float = blueSlider.value
        let redValue: CGFloat = CGFloat(r)
        let greenValue: CGFloat = CGFloat(g)
        let blueValue: CGFloat = CGFloat(b)
        
        colorView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
    }


}


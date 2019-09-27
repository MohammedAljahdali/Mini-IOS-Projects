//
//  DetailViewController.swift
//  BondVillains
//
//  Created by Mohammed Khakidaljahdali on 26/09/2019.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var villainName: UILabel!
    
    
    var villain: Villain! = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()
        villainName.text = villain.name
        villainImage.image = UIImage.init(named: villain.imageName)
    }
    
    
  

}

//
//  ViewController.swift
//  RockPapper
//
//  Created by Mohammed Khakidaljahdali on 13/09/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func valueGenrator() -> Int {
        return Int.random(in: 0...2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sicView" {
            let controller = segue.destination as! SicViewController
            controller.choice = valueGenrator()
        } else if segue.identifier == "papperView" {
            let controller = segue.destination as! PapperViewController
            controller.choice = valueGenrator()
        }
    }
    
    @IBAction func papper() {
        performSegue(withIdentifier: "papperView", sender: self)
    }
    
    @IBAction func rock() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "rockView") as! RockViewController
        controller.choice = valueGenrator()
        
        present(controller, animated: true, completion: nil)
    }


}


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
    enum Buttons: Int { case imagePickerView = 0, activityView, alertView}
    @IBAction func experiment(sender: UIButton) {
        switch (Buttons(rawValue: sender.tag)!) {
        case .imagePickerView:
            let imageController = UIImagePickerController()
            present(imageController, animated: true, completion: nil)
        case .activityView:
            let image = UIImage()
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            present(activityController, animated: true, completion: nil)
            
        case .alertView:
            let alertController = UIAlertController()
            alertController.title = "Hello"
            alertController.message = "World"
            let alertAction = UIAlertAction(title: "Hey", style: UIAlertAction.Style.default) {
                action in self.dismiss(animated: true, completion: nil)
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
        
    }

    
}


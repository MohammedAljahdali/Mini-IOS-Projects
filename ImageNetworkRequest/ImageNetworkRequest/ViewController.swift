//
//  ViewController.swift
//  ImageNetworkRequest
//
//  Created by Mohammed Khakidaljahdali on 14/10/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum KittenImageLocation: String {
        case http = "http://www.kittenswhiskers.com/wp-content/uploads/sites/23/2014/02/Kitten-playing-with-yarn.jpg"
        case https = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kitten_in_Rizal_Park%2C_Manila.jpg/460px-Kitten_in_Rizal_Park%2C_Manila.jpg"
        case error = "not a url"
    }
    
    let stringURL = KittenImageLocation.http.rawValue
    
    @IBOutlet weak var requestedImage: UIImageView!
    
    @IBAction func requestImage(_ sender: Any) {
        let url = URL(string: stringURL)
//        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            guard let data = data else { print("error in the image request"); return }
//            DispatchQueue.main.async {
//            let kittenImage = UIImage(data: data)
//            self.requestedImage.image = kittenImage
//            }
//        }
//        task.resume()
        let task = URLSession.shared.downloadTask(with: url!, completionHandler: { (location, response, error) in
            guard let location = location else { print("error in image download request"); return }
            print(location)
            do {
                let imageData = try Data(contentsOf: location)
                let kittenImage = UIImage(data: imageData)
                DispatchQueue.main.async { self.requestedImage.image = kittenImage }
                    
            } catch {
                print(error)
            }
            
            
        }
        )
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


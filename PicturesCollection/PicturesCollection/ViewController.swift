//
//  ViewController.swift
//  PicturesCollection
//
//  Created by Mohammed Khakidaljahdali on 13/10/2019.
//  Copyright © 2019 Mohammed. All rights reserved.
//

import UIKit


class ViewController: UICollectionViewController {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    func loadPicture() {
        appDelegate.photos.append(#imageLiteral(resourceName: "bridge"))
        appDelegate.photos.append(#imageLiteral(resourceName: "eiffel"))
        appDelegate.photos.append(UIImage(named: "road")!)
        appDelegate.photos.append(UIImage(named: "standing on the mountain")!)
        appDelegate.photos.append(UIImage(named: "winter")!)
        appDelegate.photos.append(UIImage(named: "waterfall")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPicture()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appDelegate.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath) as! PictureCell
        let image = appDelegate.photos[indexPath.row]
        cell.pic.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        //TODO: Set the left and right spacing of a cell to be 2
        return UIEdgeInsets (top: 0, left: 2, bottom: 0, right: 2)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //TODO: Set the columns to 2 and the rows to 2 in a rectangle area of the collection view (ususally the area visible on the secreen).
        
        let bounds = collectionView.bounds
        
        return CGSize(width: (bounds.width/2)-4 , height: bounds.height/2)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //TODO: Set minimumLineSpacing to 0
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        //TODO: Set minimumInteritemSpacing to 0
        return 0
    }
    

    


}


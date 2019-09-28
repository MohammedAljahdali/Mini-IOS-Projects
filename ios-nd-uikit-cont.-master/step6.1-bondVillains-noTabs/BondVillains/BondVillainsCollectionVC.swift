//
//  BondVillainsCollectionVC.swift
//  BondVillains
//
//  Created by Mohammed Khakidaljahdali on 28/09/2019.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BondVillainsCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: model
    let allVillains: [Villain] = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let villains = appDelegate.allVillains
        return villains
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let width = (view.frame.width-20)/3
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: width, height: width)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allVillains.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BondVillainCollectionViewCell
        let villain = allVillains[indexPath.item]
        // Configure the cell
        cell.bondVillainImageView.image = UIImage(named: villain.imageName)
        cell.bondVillainImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        cell.bondVillainName.text = villain.name
        cell.bondVillainName.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        cell.bondVillainName.textColor = UIColor.red
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "VillainDetailViewController") as! VillainDetailViewController
        let villain = allVillains[indexPath.item]
        controller.villain = villain
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

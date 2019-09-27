//
//  CustomBondVillainsCell.swift
//  BondVillains
//
//  Created by Mohammed Khakidaljahdali on 27/09/2019.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
class BondVillainsCustomCell: UITableViewCell {
    
    var bondVillainImage: UIImage!
    var bondVillainName: String!
    var bondVillainScheme: String!
    
    var bondVillainImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    var bondVillainNameView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    var bondVillainSchemeView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bondVillainImageView)
        addSubview(bondVillainNameView)
        addSubview(bondVillainSchemeView)
        
        bondVillainImageView.leftAnchor.constraint(equalTo: bondVillainImageView.leftAnchor).isActive = true
        bondVillainImageView.rightAnchor.constraint(equalTo: bondVillainImageView.rightAnchor).isActive = true
        bondVillainImageView.topAnchor.constraint(equalTo: bondVillainImageView.topAnchor).isActive = true
        bondVillainImageView.bottomAnchor.constraint(equalTo: bondVillainImageView.bottomAnchor).isActive = true
        bondVillainImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        bondVillainImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        bondVillainNameView.topAnchor.constraint(equalTo: bondVillainImageView.bottomAnchor).isActive = true
        bondVillainNameView.leftAnchor.constraint(equalTo: bondVillainNameView.leftAnchor).isActive = true
        bondVillainNameView.rightAnchor.constraint(equalTo: bondVillainNameView.rightAnchor).isActive = true
        bondVillainNameView.bottomAnchor.constraint(equalTo: bondVillainNameView.bottomAnchor).isActive = true
        
        bondVillainSchemeView.topAnchor.constraint(equalTo: bondVillainNameView.bottomAnchor).isActive = true
        bondVillainSchemeView.leftAnchor.constraint(equalTo: bondVillainSchemeView.leftAnchor).isActive = true
        bondVillainSchemeView.rightAnchor.constraint(equalTo: bondVillainSchemeView.rightAnchor).isActive = true
        bondVillainSchemeView.bottomAnchor.constraint(equalTo: bondVillainSchemeView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bondVillainImageView.image = bondVillainImage
        bondVillainNameView.text = bondVillainName
        bondVillainSchemeView.text = bondVillainScheme
    }
    
    
    
    
    
    
}

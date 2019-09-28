//
//  BondVillainTableViewCell.swift
//  BondVillains
//
//  Created by Mohammed Khakidaljahdali on 28/09/2019.
//  Copyright © 2019 Udacity. All rights reserved.
//

import UIKit

class BondVillainTableViewCell: UITableViewCell {

    @IBOutlet weak var bondVillainImageView: UIImageView!
    @IBOutlet weak var bondVillainSchemeLabel: UILabel!
    @IBOutlet weak var bondVillainNameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

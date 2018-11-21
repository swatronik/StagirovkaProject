//
//  AuthButtonViewCell.swift
//  StagirovkaProject
//
//  Created by Admin on 21/11/2018.
//  Copyright © 2018 PolyakovDenis. All rights reserved.
//

import UIKit

class AuthButtonViewCell: UITableViewCell {
    
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = button.bounds.height / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  AchieveTableViewCell.swift
//  Multiplication Table
//
//  Created by Mike on 21.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class AchieveTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

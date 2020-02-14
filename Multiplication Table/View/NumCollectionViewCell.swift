//
//  NumCollectionViewCell.swift
//  Multiplication Table
//
//  Created by Mike on 14.02.2020.
//  Copyright © 2020 Mike Team. All rights reserved.
//

import UIKit

class NumCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numButton: UIButton!
    
    @IBAction func numPressed(_ sender: UIButton) {
        print("BUTTON PRESSED")
    }    
}

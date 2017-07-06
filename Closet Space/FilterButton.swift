//
//  FilterButton.swift
//  Closet Space
//
//  Created by Saketh D on 7/5/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class FilterButton: UIButton {

    override func awakeFromNib() {
        self.layer.borderColor = DANDELIONCOLOR.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }

}

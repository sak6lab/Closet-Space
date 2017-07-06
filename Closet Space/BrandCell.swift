//
//  BrandCell.swift
//  Closet Space
//
//  Created by Saketh D on 6/29/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class BrandCell: UITableViewCell {
    
    @IBOutlet weak var brandImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(image: UIImage){
        brandImageView.image = image
    }

}

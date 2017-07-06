//
//  ItemCell.swift
//  Closet Space
//
//  Created by Saketh D on 6/30/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var priceView: UILabel!
    @IBOutlet weak var sizeView: UILabel!
    
    func configureCell(image: UIImage, name: String, price:String, size: String){
        imageView.image = image
        nameView.text = name
        priceView.text = price
        sizeView.text = size
    }

}

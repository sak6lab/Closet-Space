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
    @IBOutlet weak var buyButton: UIButton!
    
    private var setConstraints: Bool = false
    
    func configureCell(image: UIImage, name: String, price:String, size: String){
        imageView.image = image
        imageView.wrapImage()
        nameView.text = name
        priceView.text = price
        sizeView.text = size
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
    }
    
    func selectCell(){
        guard !(setConstraints) else {
            return
        }
        self.contentView.removeConstraints(self.contentView.constraints)

        //ImageView
        imageView.removeConstraints(imageView.constraints)
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo:bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
        //NameView
        nameView.removeConstraints(nameView.constraints)
        nameView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        nameView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        nameView.font = UIFont(name: "Helvetica Neue", size: 30)
        
        //SizeView
        sizeView.removeConstraints(sizeView.constraints)
        sizeView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        sizeView.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: 8).isActive = true
        sizeView.font = UIFont(name: "Helvetica Neue", size: 24)
        
        //PriceView
        priceView.removeConstraints(priceView.constraints)
        priceView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        priceView.topAnchor.constraint(equalTo: sizeView.bottomAnchor, constant: 8).isActive = true
        priceView.font = UIFont(name: "Helvetica Neue", size: 24)
        setConstraints = true
        
        //BuyButton
        buyButton.isHidden = false
        buyButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        buyButton.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 8).isActive = true
        buyButton.widthAnchor.constraint(equalTo: priceView.widthAnchor).isActive = true
    }
    
    @IBAction func pressedBuyButton(_ sender: Any) {
        
    }
}

//MARK: -Remove empty space created by aspect fit
extension UIImageView{
    func wrapImage(){
        self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: (self.image?.size.width)! / (self.image?.size.height)!).isActive = true
    }
}


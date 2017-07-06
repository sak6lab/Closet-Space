//
//  item.swift
//  Closet Space
//
//  Created by Saketh D on 6/29/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//
import UIKit

class Item{
    private var gender: Gender
    private var type: Type
    private var name: String
    private var price: Double
    private var image: UIImage
    private var size: String
    
    func getGender() -> Gender{
        return gender
    }
    
    func getType() -> Type{
        return type
    }
    
    func getPrice() -> Double{
        return price
    }
    
    func getImage() -> UIImage{
        return image
    }
    
    func getSize() -> String{
        return size
    }
    
    func getName() -> String{
        return name
    }
    
    init(gender: Gender, price: Double, image: UIImage, size: String, type: Type, name: String) {
        self.gender = gender
        self.price = price
        self.image = image
        self.size = size
        self.type = type
        self.name = name
    }
    
    func heightForItem() -> CGFloat{
        switch type {
        case .Accessory:
            return 100
        case .Jeans:
            return 240
        case .Pants:
            return 240
        case .Shorts:
            return 160
         case .Suits:
            return 240
        case.Underwear:
            return 100
        case .Shoes:
            return 160
        default:
            return 200
        }
    }
}

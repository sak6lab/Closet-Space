//
//  Brend.swift
//  Closet Space
//
//  Created by Saketh D on 6/29/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//
import UIKit
class Brand{
    private var items: Array<Item>
    private var name: String
    private var image: UIImage!
    
    func getItems() -> Array<Item>{
        return items
    }
    
    func getName() -> String{
        return name
    }
    
    func getImage() -> UIImage{
        return image
    }
    
    init(items: Array<Item>, name: String, image: UIImage) {
        self.items = items
        self.name = name
        self.image = image
    }
    
}

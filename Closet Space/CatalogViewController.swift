//
//  CatalogViewController.swift
//  Closet Space
//
//  Created by Saketh D on 7/5/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

//TO-DO:Filter, Enlarge Selection

import UIKit

private let reuseIdentifier = "ItemCell"

final class CatalogViewController: UICollectionViewController {
    //MARK: -properties
    var brand: Brand!
    
    fileprivate let itemsPerRow:CGFloat = 3
    fileprivate let sectionInsets = UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20)
    
    var selectedItemIndexPath: IndexPath?{
        didSet{
            var indexPaths = [IndexPath]()
            if let selectedItemIndexPath = selectedItemIndexPath{
                indexPaths.append(selectedItemIndexPath)
            }
            if let oldValue = oldValue{
                indexPaths.append(oldValue)
            }
            
            collectionView?.performBatchUpdates({
                self.collectionView?.reloadItems(at: indexPaths)
            }) { completed in
                if let selectedItemIndexPath = self.selectedItemIndexPath{
                    self.collectionView?.scrollToItem(at: selectedItemIndexPath, at: .centeredVertically, animated: true)
                }
            }
        }
    }
}

//MARK: -CollectionViewDataSource
extension CatalogViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brand.getItems().count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCell
        
        if indexPath == selectedItemIndexPath {
            cell.selectCell()
        }
        
        let item = brand.getItems()[indexPath.row]
        let price = String(format: "$%.02f", arguments: [item.getPrice()])
        cell.configureCell(image: item.getImage(), name: item.getName(), price: price, size: item.getSize())
        return cell
    }
}

//MARK: -CollectionViewDelegate
extension CatalogViewController {
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        selectedItemIndexPath = selectedItemIndexPath == indexPath ? nil : indexPath
        return false
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

//MARK: -CollectionViewFlowDelegate
extension CatalogViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath == selectedItemIndexPath {
            var size = collectionView.bounds.size
            size.height -= topLayoutGuide.length
            size.height -= (sectionInsets.top + sectionInsets.bottom)
            size.height /= 3
            size.width -= (sectionInsets.left + sectionInsets.right)
            
            return size
        }
        
        let item = brand.getItems()[indexPath.row]
        
        let paddingSpace = (sectionInsets.left) * (itemsPerRow + 1)
        let availableSpace = view.frame.width - paddingSpace
        let widthPerItem = availableSpace/itemsPerRow
        let heightForItem = item.heightForItem()
        
        return CGSize(width: widthPerItem, height: heightForItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}


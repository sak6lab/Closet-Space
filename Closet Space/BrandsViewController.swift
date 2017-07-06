//
//  ViewController.swift
//  Closet Space
//
//  Created by Saketh D on 6/29/17.
//  Copyright © 2017 Saketh D. All rights reserved.
//

import UIKit

final class BrandsViewController: UIViewController {
    //MARK: -Properties and Initalization
    @IBOutlet weak var brandsTableView: UITableView!
    fileprivate var brands: Array<Brand>!
    
    fileprivate var brandToSend: Brand!
    
    fileprivate let SegueCatalogIdentifier = "ToCatalogVC"
    fileprivate let BrandCellReuseIdentifier = "BrandCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Closet Space"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.black
        
        //sample data
        let brand = Brand(items: [Item(gender: .Men, price: 12.00, image: #imageLiteral(resourceName: "download-1"), size: "Medium", type: Type.Shirt, name: "White Tee")], name: "Gildan", image: #imageLiteral(resourceName: "gildan"))
        brands = [brand]
    }
}

//MARK: -TableViewDataSource
extension BrandsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = brandsTableView.dequeueReusableCell(withIdentifier: BrandCellReuseIdentifier, for: indexPath) as? BrandCell{
            let brand = brands[indexPath.row]
            cell.configureCell(image: brand.getImage())
            return cell
        }
        return UITableViewCell()
    }
}

//MARK: TableViewDelegate
extension BrandsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        brandToSend = brands[indexPath.row]
        performSegue(withIdentifier: SegueCatalogIdentifier, sender: self)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

//MARK: -Segue
extension BrandsViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CatalogViewController{
            destination.brand = brandToSend
        }
    }
}



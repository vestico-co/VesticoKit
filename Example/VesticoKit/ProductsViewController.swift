//
//  ViewController.swift
//  VesticoKit
//
//  Created by Vestico Ltd. on 08/01/2022.
//  Copyright (c) 2022 557660. All rights reserved.
//

import UIKit

class ProductsViewController: UITableViewController {
    
    let products = ["6257233395879", "6733924991143", "6196672004263", "7219512443047", "6255934996647"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Products"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productUID = products[indexPath.row]
        let productViewController = ProductViewController.instantiate(with: productUID)
        navigationController?.pushViewController(productViewController, animated: true)
    }
}

//
//  ViewController.swift
//  VesticoKit
//
//  Created by Vestico Ltd. on 08/01/2022.
//  Copyright (c) 2022 557660. All rights reserved.
//

import UIKit
import VesticoKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var fitMatchButton: UIButton!
    @IBOutlet weak var fitMatchNotAvailableLabel: UILabel!
    @IBOutlet weak var carouselContainer: UIView!
    
    internal var productUID: String!
    
    internal static func instantiate(with productUID: String) -> ProductViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProductViewController") as!ProductViewController
        viewController.productUID = productUID
        return viewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide before setting the product. The delegate callbacks might come back instantenously
        self.carouselContainer.isHidden = true
        self.fitMatchButton.isHidden = !VesticoKit.canDisplayFitMatchButton
        self.fitMatchNotAvailableLabel.isHidden = true
        
        VesticoKit.delegate = self
        guard let productUID = productUID else {
            return
        }
        self.title = productUID
        VesticoKit.configure(for: productUID, presenting: .carousel)
    }
    
    @IBAction func fitMatch(_ sender: Any) {
        let vc = VesticoKit.getFitMatchViewController()
        self.present(vc, animated: true)
    }
}

extension ProductViewController: VesticoSessionDelegate {
    
    func didLoadProduct(_ product: String) {
        print("product loaded \(product)")
        print("show content carousel")
        self.carouselContainer.isHidden = false
        self.fitMatchButton.isHidden = !VesticoKit.canDisplayFitMatchButton
        self.fitMatchNotAvailableLabel.isHidden = VesticoKit.canDisplayFitMatchButton
    }
    
    func didReceiveFitMatchUpdate(forProduct product: String, enabled: Bool) {
        print("show fit match button, product \(product): \(enabled)")
        fitMatchButton.isHidden = !enabled
        self.fitMatchNotAvailableLabel.isHidden = enabled
    }
}

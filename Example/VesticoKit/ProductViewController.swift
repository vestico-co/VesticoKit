//
//  ViewController.swift
//  VesticoKit
//
//  Created by Vestico Ltd. on 08/01/2022.
//  Copyright (c) 2022 Vestico Ltd.. All rights reserved.
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
        self.fitMatchButton.isHidden = !VesticoKit.canDisplayButton
        self.fitMatchNotAvailableLabel.isHidden = true
        
        VesticoKit.delegate = self
        guard let productUID = productUID else {
            return
        }
        self.title = productUID
        VesticoKit.configure(forProductUID: productUID, presenting: .carousel)
    }
    
    @IBAction func showFitMatch(_ sender: Any) {
        let vc = VesticoKit.getFitMatchViewController()
        self.present(vc, animated: true)
    }
}

extension ProductViewController: VesticoKitDelegate {
    
    func didLoadProduct(withUID productUID: String) {
        print("product loaded \(productUID)")
        print("show content carousel")
        self.carouselContainer.isHidden = false
        self.fitMatchButton.isHidden = !VesticoKit.canDisplayButton
        self.fitMatchNotAvailableLabel.isHidden = VesticoKit.canDisplayButton
    }
    
    func didReceiveButtonUpdate(forProductUID product: String, contentMatchEnabled: Bool, sizeRecommendationEnabled: Bool) {
        print("show match button, product \(product): content: \(contentMatchEnabled), size rec: \(sizeRecommendationEnabled)")
        let showButton = (contentMatchEnabled || sizeRecommendationEnabled)
        self.fitMatchButton.isHidden = !showButton
        self.fitMatchNotAvailableLabel.isHidden = showButton
    }
    
}

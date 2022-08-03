//
//  ViewController.swift
//  VesticoKit
//
//  Created by Vestico Ltd. on 08/01/2022.
//  Copyright (c) 2022 Vestico Ltd.. All rights reserved.
//

import Foundation
import UIKit
import VesticoKit

class ConversionViewController: UIViewController {
    
    @IBAction func recordConversion(_ sender: Any) {
        let orderItems: [OrderItem] = [
            OrderItem(withProductUID: "6257233395879", variant: "Small")
        ]
        VesticoKit.recordConversion(forOrderUID: "TEST", items: orderItems)
    }
}

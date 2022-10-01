//
//  InterfaceController.swift
//  project_iWatch WatchKit Extension
//
//  Created by Ruslan Dalgatov on 29.09.2022.
//

import WatchKit
import Foundation
import UIKit


class InterfaceController: WKInterfaceController {


    @IBOutlet weak var coinName: WKInterfaceLabel!
    
    var coinImagesArray: [UIImage] = []
    
    @IBOutlet weak var image: WKInterfaceImage!

        
//    createCoinImagesArray(count: 76, name: "Coin")
    
    @IBAction func buttonTapped() {
        
        let status = Bool.random()
        
        if status {
            image.setImageNamed("head")
            coinName.setText("Орёл")
        } else {
            image.setImageNamed("tail")
            coinName.setText("Решка")
        }

    }


}

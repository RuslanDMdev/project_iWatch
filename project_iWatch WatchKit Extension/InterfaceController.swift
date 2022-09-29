//
//  InterfaceController.swift
//  project_iWatch WatchKit Extension
//
//  Created by Ruslan Dalgatov on 29.09.2022.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {


    @IBOutlet weak var coinName: WKInterfaceLabel!
    
    
    let array = ["Орёл", "Решка"]
    
    @IBAction func buttonTapped() {
        coinName.setText(array[Int.random(in: 0...array.count-1)])
    }


}

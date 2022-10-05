//
//  InterfaceController.swift
//  project_iWatch WatchKit Extension
//
//  Created by Ruslan Dalgatov on 29.09.2022.
//

import WatchKit
import Foundation
import UIKit
import MediaPlayer


class InterfaceController: WKInterfaceController {

    var player: AVPlayer!
    @IBOutlet weak var button: WKInterfaceButton!
    @IBOutlet weak var coinName: WKInterfaceLabel!
    var coinImagesArray: [UIImage] = []
    @IBOutlet weak var image: WKInterfaceImage!
    @IBAction func buttonTapped() {
  
        image.setImageNamed("animation_images")
//        coinAnimation()
    }
    
    func coinAnimation(){
    
        let status = Bool.random()
        
        if status {
            image.setImageNamed("head")
            coinName.setText("Орёл")
            player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "coin2", ofType: "mp3")!))
            player.play()
        } else {
            image.setImageNamed("tail")
            coinName.setText("Решка")
            player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "coin2", ofType: "mp3")!))
            player.play()
        }
        
    }


    
}


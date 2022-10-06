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
    override func awake(withContext context: Any?) {
        image.setImageNamed("head")
    }

    
    
    @IBAction func buttonTapped() {
  
        image.setImageNamed("anim")
        image.startAnimatingWithImages(in: NSRange(location: 1, length: 53), duration: 0.25, repeatCount: 3)
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "coin2", ofType: "mp3")!))
        player.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            self.coinAnimation()
        }
    }
    
    func coinAnimation(){
    
        let status = Bool.random()
        
        if status {
            image.setImageNamed("head")
            coinName.setText("Орёл!")

        } else {
            image.setImageNamed("tail")
            coinName.setText("Решка!")

        }
        
    }


    
}


//
//  ViewController.swift
//  project_iWatch
//
//  Created by Ruslan Dalgatov on 29.09.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let label = UILabel()
    @IBOutlet weak var imageView: UIButton!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        
        label.textAlignment = .center
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(346)
            make.width.equalTo(346)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
            make.height.equalTo(65)
            make.width.equalTo(200)
        }
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bg")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
          UIImage(named: "bg3")?.draw(in: self.view.bounds)
          let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
          UIGraphicsEndImageContext()
          self.view.backgroundColor = UIColor(patternImage: image)
        
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let status = Bool.random()
        
        if status {
            imageView.setImage(UIImage(named: "head"), for: .normal)
            label.text = "Орёл"
        } else {
            imageView.setImage(UIImage(named: "tail"), for: .normal)
            label.text = "Решка"
        }
        
        
        UIView.transition(with: imageView, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)

        
    }
    
    
    
}


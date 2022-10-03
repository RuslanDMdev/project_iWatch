//
//  ViewController.swift
//  project_iWatch
//
//  Created by Ruslan Dalgatov on 29.09.2022.
//

import UIKit
import SnapKit
import MediaPlayer

class ViewController: UIViewController {

    var player: AVPlayer!
    let label = UILabel()
    let imageView2 = UIImageView()
    var coinImagesArray: [UIImage] = []
    
    @IBOutlet weak var button: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(imageView2)
        
        
        imageView2.image = UIImage(named: "head")
        createCoinImagesArray(count: 53, name: "Coin")
        
        imageView2.snp.makeConstraints { make in
            make.height.equalTo(220)
            make.width.equalTo(220)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
            make.width.equalTo(100)
            make.height.equalTo(50)
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
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "coin", ofType: "mp3")!))
        player.play()
        
        imageView2.image = nil
        flipCoinImages(imageView: imageView2, images: coinImagesArray)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            self.imageTapped((Any).self)
        }

        
    }
    
    @objc func imageTapped(_ sender: Any) {
        let status = Bool.random()
        
        if status {
            imageView2.image = UIImage(named: "head")
            label.text = "Орёл!"
        } else {
            imageView2.image = UIImage(named: "tail")
            label.text = "Решка!"
        }
        
        
    }

    
    @objc func flipCoinButton() {
        imageView2.image = nil
        flipCoinImages(imageView: imageView2, images: coinImagesArray)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.05) {
            self.imageTapped((Any).self)
        }
    }


        func createCoinImagesArray(count: Int, name: String) {
            for i in 1...count {
                guard let imageName = UIImage(named: "\(name)\(i)") else { return }
                coinImagesArray.append(imageName)
              }
            print(coinImagesArray)
        }

        func flipCoinImages(imageView: UIImageView, images: [UIImage]) {

            imageView.animationImages = images
            imageView.animationDuration = 0.25
            imageView.animationRepeatCount = 3
            imageView.startAnimating()
        }
    
    
}


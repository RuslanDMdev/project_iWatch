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
    var labelHello = UILabel()
    let imageView2 = UIImageView()
    var coinImagesArray: [UIImage] = []
    var button = UIButton()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(labelHello)
        view.addSubview(label)
        view.addSubview(imageView2)
        view.addSubview(button)
        
        
        imageView2.image = UIImage(named: "head")
        createCoinImagesArray(count: 53, name: "Coin")
        
        imageView2.snp.makeConstraints { make in
            make.height.equalTo(370)
            make.width.equalTo(500)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        labelHello.text = "Нажми, свайпни или потряси!"
        labelHello.font = UIFont.boldSystemFont(ofSize: 35)
        labelHello.textColor = .white
        labelHello.textAlignment = .center
        labelHello.numberOfLines = 0
        labelHello.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
            make.left.right.equalToSuperview().inset(40)
        }
            
        label.text = "Испытай удачу!"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
            make.left.right.equalToSuperview().inset(40)
        }
        
        
        
        button.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bg")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
          UIImage(named: "bg3")?.draw(in: self.view.bounds)
          let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
          UIGraphicsEndImageContext()
          self.view.backgroundColor = UIColor(patternImage: image)
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "coin2", ofType: "mp3")!))
        
    }

    @objc func buttonTapped() {
//        imageView2.image = nil
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "coin2", ofType: "mp3")!))
        player.play()
        
        flipCoinImages(imageView: imageView2, images: coinImagesArray)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.imageTapped((Any).self)
        }

        labelHello.isHidden = true
    }
    
     func imageTapped(_ sender: Any) {
        let status = Bool.random()
        
        if status {
            imageView2.image = UIImage(named: "head")
            label.text = "Орёл!"
        } else {
            imageView2.image = UIImage(named: "tail")
            label.text = "Решка!"
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

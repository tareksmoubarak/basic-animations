//
//  ViewController.swift
//  Animations
//
//  Created by Tarek Moubarak on 9/29/18.
//  Copyright © 2018 Tarek Moubarak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var counter = 2;
    
    var timer = Timer()
    
    var isAnimating = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func next(_ sender: Any) {
        image.image = UIImage(named: "frame_\(counter)_delay-0.03s.png")
        counter += 1
        if counter == 30 {
            counter = 1
        }
    }
    
    @objc func animate() {
        image.image = UIImage(named: "frame_\(counter)_delay-0.03s.png")
        counter += 1
        if counter == 30 {
            counter = 1
        }
//        button.setTitle("Stop", for: [])
    }
    
    @IBAction func start(_ sender: Any) {
        if isAnimating {
            timer.invalidate()
            isAnimating = false
        }else{
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            isAnimating = true
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        isAnimating = false
    }
    
    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - image.frame.width, y: image.center.y)
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x + self.image.frame.width, y: self.image.center.y)
        })
    }
    
    @IBAction func grow(_ sender: Any) {
        let imageWidth = image.frame.width
        let imageHeight = image.frame.height
//        let imageCenterY = image.center.y
//        let imageCenterX = image.center.x
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1, animations: {
            self.image.frame = CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight)
        })
    }
    
}


//
//  ViewController.swift
//  Ailen_Animation_Time
//
//  Created by 정순우 on 2018. 4. 5..
//  Copyright © 2018년 정순우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 1
    var timer = Timer()
    var direction = true
    var playing = true

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = String(counter)
        image.image = UIImage(named: "frame1.png")
    }
    @IBAction func start(_ sender: Any) {
        
        if playing == false {
            timer.invalidate()
            playing = true
        
        } else if playing == true {
              timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.doAnimation), userInfo: nil, repeats: true)
            playing = false
        }
    }
    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
    }
    
    @objc func doAnimation() {
        if counter == 5 {
            direction = false
        }else if counter == 1 {
            direction = true
        }
        
        if direction == true {
            counter = counter + 1
        } else if direction == false {
            counter = counter - 1
        }
        
        image.image = UIImage(named: "frame\(counter).png")
        label.text = String(counter)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


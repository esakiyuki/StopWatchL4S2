//
//  ViewController.swift
//  StopWatch
//
//  Created by esaki yuki on 2020/09/06.
//  Copyright © 2020 esaki yuKki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    //小数点も表示
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start() {
        //timer.isValidだと動いてる状態だから!timer.isValidで動いてないになる
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stop() {
        if timer.isValid {
            //タイマーが動いていたら止める
            timer.invalidate()
        }
    }
    
    @IBAction func reset() {
        if timer.isValid {
            timer.invalidate()
        }
        count = 0.00
        label.text = String(count)
            
    }
    
    //self.upで呼び出すメソッド
    @objc func up() {
        count = count + 0.01
        //小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }


}


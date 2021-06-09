//
//  ViewController.swift
//  Bai1
//
//  Created by Trang Huyền on 6/9/21.
//

import UIKit

enum Time {
    case Start
    case Pause
}

class ViewController: UIViewController {

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    var timer : Timer!
    var numberSection = 0
    var timeType : Time = .Start
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runLoop), userInfo: nil, repeats: true)
    }
    
    @objc func runLoop (){
        numberSection += 1
        timeLabel.text = stringFromNumberSection(numberSection)
    }
    
    func stringFromNumberSection(_ numberSection : Int) -> String {
        let gio = numberSection / 3600
        let phut = (numberSection%3600)/60
        let giay = (numberSection%3600)%60
        
        return "\(gio < 10 ? "0\(gio)" : "\(gio)") : \(phut < 10 ? "0\(phut)" : "\(phut)") : \(giay < 10 ? "0\(giay)" : "\(giay)")"
    }
    
    @IBAction func startBtn(_ sender: Any) {
        if timeType == Time.Start {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runLoop), userInfo: nil, repeats: true)
            start.setTitle("Pause", for: .normal)
            
        }
        else{
            start.setTitle("Start", for: .normal)
            timeType = Time.Start
            timer.invalidate()
        }
    }

    @IBAction func resertBtn(_ sender: Any) {
        numberSection = 0
        timeLabel.text = "00 : 00 : 00"
    }
    
}


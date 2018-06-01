//
//  ViewController.swift
//  TimerComparison
//
//  Created by Steven Lipton on 5/23/18.
//  Copyright © 2018 Steven Lipton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var differenceLabel: UILabel!
    let interval = 1.0/30.0
    var timer = Timer()
   
    @IBAction func didToggleTimer(_ sender: UIButton) {
       var timerCount = 0.0
        let startDate = Date()
        if !timer.isValid{
            timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block:
                { (timer) in
                    timerCount += self.interval
                    self.countLabel.text = String(format:"Timer %06.4f",timerCount)
                    let duration = DateInterval(start: startDate, end: Date()).duration
                    self.dateLabel.text = String(format:"Date %06.4f",duration)
                    self.differenceLabel.text = String(format:"Diffrence %06.4f",duration - timerCount)
            })
        } else {
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


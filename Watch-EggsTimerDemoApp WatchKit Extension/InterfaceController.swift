//
//  InterfaceController.swift
//  Watch-EggsTimerDemoApp WatchKit Extension
//
//  Created by User on 12/8/15.
//  Copyright © 2015 Elijah Buters. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    //Outlets
    @IBOutlet var liquidTimeLabel: WKInterfaceLabel!
    @IBOutlet var softTimeLabel: WKInterfaceLabel!
    @IBOutlet var hardTimeLabel: WKInterfaceLabel!
    
    //Buttons
    @IBOutlet var yellowButton: WKInterfaceButton!
    @IBOutlet var orangeButton: WKInterfaceButton!
    @IBOutlet var redButton: WKInterfaceButton!
    
    var timer = NSTimer()
    var liquidCount = 239
    var softCount = 292
    var hardCount = 362
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    //Actions
    @IBAction func yellowButtonPressed() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("resultLiquid"), userInfo: nil, repeats: true)
    }

    @IBAction func orangeButtonPressed() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("resultSoft"), userInfo: nil, repeats: true)
    }
    
    @IBAction func redButtonPressed() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("resultHard"), userInfo: nil, repeats: true)
    }
    
    func resultLiquid() {
        
        if liquidCount == 0 {
            self.liquidTimeLabel.setText("\(liquidCount) sec")
            timer.invalidate()
        } else {
            liquidCount--
            self.liquidTimeLabel.setText("\(liquidCount) sec")
        }
    }
    
    func resultSoft() {
        
        if softCount == 0 {
            self.softTimeLabel.setText("\(softCount) sec")
            timer.invalidate()
        } else {
            softCount--
            self.softTimeLabel.setText("\(softCount) sec")
        }
    }

    func resultHard() {
    
    if hardCount == 0 {
        self.hardTimeLabel.setText("\(hardCount) sec")
        timer.invalidate()
    } else {
        hardCount--
        self.hardTimeLabel.setText("\(hardCount) sec")
    }
}

}





    


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
    @IBOutlet var readyButton: WKInterfaceButton!
    
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
            
            self.readyButton.setHidden(false)
            let yellowCollor = UIColor(red: 250.0/255, green: 181.0/255, blue: 11.0/255, alpha: 1.0)
            self.readyButton.setBackgroundColor(yellowCollor)
        } else {
            liquidCount--
            self.yellowButton.setEnabled(false)
            self.liquidTimeLabel.setText("\(liquidCount) sec")
        }
    }
    
    func resultSoft() {
        
        if softCount == 0 {
            self.softTimeLabel.setText("\(softCount) sec")
            timer.invalidate()
            
            self.readyButton.setHidden(false)
            let orangeCollor = UIColor(red: 255.0/255, green: 130.0/255, blue: 17.0/255, alpha: 1.0)
            self.readyButton.setBackgroundColor(orangeCollor)
        } else {
            softCount--
            self.orangeButton.setEnabled(false)
            self.softTimeLabel.setText("\(softCount) sec")
        }
    }

    func resultHard() {
    
    if hardCount == 0 {
        self.hardTimeLabel.setText("\(hardCount) sec")
        timer.invalidate()
        
        self.readyButton.setHidden(false)
        let redCollor = UIColor(red: 227.0/255, green: 36.0/255, blue: 24.0/255, alpha: 1.0)
        self.readyButton.setBackgroundColor(redCollor)
    } else {
        hardCount--
        self.redButton.setEnabled(false)
        self.hardTimeLabel.setText("\(hardCount) sec")
    }
}
    @IBAction func readyButtonPressed() {
        
        self.liquidTimeLabel.setText("3:59")
        self.softTimeLabel.setText("4:52")
        self.hardTimeLabel.setText("6:02")
        
        self.readyButton.setHidden(true)
        self.yellowButton.setEnabled(true)
        self.orangeButton.setEnabled(true)
        self.redButton.setEnabled(true)
    }

}





    


//
//  ViewController.swift
//  stopwaatch v1.1
//
//  Created by kapil dev on 12/10/18.
//  Copyright © 2018 bauhaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stopWatchTimer = Timer()
    var currentTime = 0
    var miniSeconds = 0
    var seconds = 0
    var minutes = 0
    
    // IBOutlets
    
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var miniSecondsLabel: UILabel!
    
    
    // IBActions
    @IBAction func hasStartButtonPressed(_ sender: UIButton)
    {
        //hide start button and enable stop button
        startButton.isHidden = true
        pauseButton.isHidden = false
        stopButton.isEnabled = true
        
        stopWatchTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: (#selector(ViewController.updateTime)), userInfo: nil, repeats: true)
    }
    @IBAction func hasPauseButtonPressd(_ sender: UIButton)
    {
        startButton.isHidden = false
        pauseButton.isHidden = true
        
        stopWatchTimer.invalidate()// Pauser The Timer
    }
    @IBAction func hasStopButtonPressed(_ sender: UIButton)
    {
        pauseButton.isHidden = true
        startButton.isHidden = false
        stopButton.isEnabled = false
        
        currentTime = 0
        minutesLabel.text = "0"
        secondsLabel.text = "0"
        miniSecondsLabel.text = "00"
        
        stopWatchTimer.invalidate()
    }
    
    @objc func updateTime()
    {
        currentTime += 1
        
        miniSeconds = currentTime % 100
        seconds = currentTime / 100
        minutes = seconds / 60
        miniSecondsLabel.text = "\(miniSeconds)"
        secondsLabel.text = "\(seconds%60)"
        minutesLabel.text = "\(minutes)"
        if currentTime == 360000
        {
            currentTime = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // pause button is hidden and stop is not enabled
        pauseButton.isHidden  = true
        stopButton.isEnabled = false
        
    }


}


//
//  StartController.swift
//  WYR
//
//  Created by Dominic Monn on 26.02.16.
//  Copyright © 2016 Dominic Monn. All rights reserved.
//

import Foundation
import UIKit

var questionIDs : Array = [Int]()


class StartController: UIViewController {
    
    
    override func viewDidLoad() {
        self.view.viewWithTag(1)?.hidden = true
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleQuestions(){
        
    }
    
    
    @IBAction func startTapped(sender : AnyObject) {
        print("Start was tapped; Calling Api")
        handleQuestions()
        self.performSegueWithIdentifier("AfterAPI", sender: true)
    
    }
}


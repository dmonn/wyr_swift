//
//  StartController.swift
//  WYR
//
//  Created by Dominic Monn on 26.02.16.
//  Copyright © 2016 Dominic Monn. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

var questionIDs : Array = [Int]()
let connectionHandler : ConnectionHandler = ConnectionHandler()


class StartController: UIViewController {
    
    func hideLoading(hide : Bool){
        self.view.viewWithTag(1)?.hidden = hide
    }
    
    override func viewDidLoad() {
        hideLoading(true)
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func handleQuestions(questions : JSON){
        
    }
    
    @IBAction func startTapped(sender : AnyObject) {
        hideLoading(false)
        connectionHandler.getQuestions() { responseObject, error in
            if((error) == nil){
                self.handleQuestions(responseObject)
            }
            else{
                // TODO: Error Handler
            }
            
            self.hideLoading(true)
            self.performSegueWithIdentifier("AfterAPI", sender: true)
            return
        }
    
    }
}


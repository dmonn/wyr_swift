//
//  StartController.swift
//  WYR
//
//  Created by Dominic Monn on 26.02.16.
//  Copyright © 2016 Dominic Monn. All rights reserved.
//

import Foundation
import UIKit

class StartController: UIViewController {
    var questionDict : NSArray = [NSDictionary]()
    let connectionHandler : ConnectionHandler = ConnectionHandler()
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let playController = segue.destinationViewController as? PlayController else { return }
        
        playController.questions = questionDict
    }
    
    @IBAction func startTapped(sender : AnyObject) {
        hideLoading(false)
        connectionHandler.getQuestions() { responseObject, error in
            if((error) == nil){
                guard let response = responseObject else { return }
                
                self.questionDict = response
            }
            else{
                // TODO: Error Handling
            }
            
            self.hideLoading(true)
            self.performSegueWithIdentifier("AfterAPI", sender: true)
            return
        }
    
    }
}


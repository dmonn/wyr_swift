//
//  PlayController.swift
//  WYR
//
//  Created by Dominic Monn on 26.02.16.
//  Copyright © 2016 Dominic Monn. All rights reserved.
//

import Foundation

import UIKit

class PlayController: UIViewController {
    var questions : NSArray?
    @IBOutlet weak var questionLabel: UILabel!
    
    func displayQuestion(question : NSDictionary){
        print(question)
        self.questionLabel.text = question["description"] as? String
    }
    
    func pickQuestion(questionArray : NSArray){
        
        let randomIndex = Int(arc4random_uniform(UInt32(questionArray.count)))
        guard let selectedQuestion = questionArray[randomIndex] as? NSDictionary else {
            return
        }
        
        displayQuestion(selectedQuestion)
        
    }
    
    func answerQuestion(option : Int){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let progressView = self.view.viewWithTag(2){
            progressView.hidden = true
        }
        
        guard let questionsArray = questions else {
            return
        }
        pickQuestion(questionsArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstOptionTapped(sender : AnyObject){
        answerQuestion(1)
    }
    
    @IBAction func secondOptionTapped(sender : AnyObject){
        answerQuestion(2)
    }
    
}
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
    
    // Variable Setup
    var questions : NSArray?
    var currentQuestion : NSDictionary?
    var lastStat : Float?
    let connectionHandler : ConnectionHandler = ConnectionHandler()
    @IBOutlet weak var questionLabel: UILabel!
    
    // Function to hide/show statistics
    func hideStats(hide : Bool){
        if let progressView = self.view.viewWithTag(2){
            progressView.hidden = hide
        }
    }
    
    // Load question description into label
    func displayQuestion(question : NSDictionary){
        print(question)
        self.questionLabel.text = question["description"] as? String
    }
    
    // Stat calculation
    func displayStats(chosenOpt : Int, stat : Float){
        hideStats(false)
    }
    
    // Pick a random question
    func pickQuestion(questionArray : NSArray){
        
        let randomIndex = Int(arc4random_uniform(UInt32(questionArray.count)))
        guard let selectedQuestion = questionArray[randomIndex] as? NSDictionary else {
            return
        }
        
        if let question = currentQuestion{
            lastStat = question.objectForKey("first_option_result") as? Float
        }
        
        displayQuestion(selectedQuestion)
    }
    
    
    // Gets triggered, when question gets answered
    func answerQuestion(option : Int){
        
        if let questionID = currentQuestion?.objectForKey("id") as? Int{
            connectionHandler.sendAnswer(option, question: questionID)
        }
        
        if let statistic = lastStat {
            displayStats(option, stat: statistic)
        }
        
        hideStats(false)
        
        if let questionsArray = questions{
            pickQuestion(questionsArray)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideStats(true)
        
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
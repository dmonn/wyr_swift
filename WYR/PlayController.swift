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
    @IBOutlet weak var statLabel: UILabel!
    @IBOutlet weak var statBar: UIProgressView!
    
    // Function to hide/show statistics
    func hideStats(hide : Bool){
        self.view.viewWithTag(2)?.hidden = hide
    }
    
    // Load question description into label
    func displayQuestion(question : NSDictionary){
        self.questionLabel.text = question["description"] as? String
    }
    
    // Stat calculation
    func displayStats(chosenOpt : Int, var stat : Float){
        hideStats(false)
        if(chosenOpt == 2){
            // If option 2 was selected, get inverted stat
            stat = Float(1)-stat
        }
        self.statLabel.text = String(Int(stat*100)) + "% think so too"
        self.statBar.progress = stat
    }
    
    // Pick a random question
    func pickQuestion(questionArray : NSArray){
        
        let randomIndex = Int(arc4random_uniform(UInt32(questionArray.count)))
        guard let selectedQuestion = questionArray[randomIndex] as? NSDictionary else {
            return
        }
        
        currentQuestion = selectedQuestion
        
        displayQuestion(selectedQuestion)
    }
    
    
    // Gets triggered, when question gets answered
    func answerQuestion(option : Int){
        
        if let questionID = currentQuestion?.objectForKey("id") as? Int{
            connectionHandler.sendAnswer(option, question: questionID)
        }
        
        if let questionStat = currentQuestion?.objectForKey("first_option_result") as? Float{
            lastStat = questionStat
        }
        
        if let statistic = lastStat {
            displayStats(option, stat: statistic)
        }
        
        
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
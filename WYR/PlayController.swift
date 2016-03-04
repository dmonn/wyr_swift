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
    var questionIndices : [Int] = []
    
    func getIndices(count : Int) -> [Int]{
        return Array(0...count)
    }
    
    func prepareQuestion(){
        print(questions)
        print(questionIndices)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let questionsArray = questions else {
            return
        }
        questionIndices = getIndices(questionsArray.count-1)
        prepareQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
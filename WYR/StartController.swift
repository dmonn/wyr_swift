//
//  StartController.swift
//  WYR
//
//  Created by Dominic Monn on 26.02.16.
//  Copyright © 2016 Dominic Monn. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

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
//        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
//            .authenticate(user: "Admin", password: "Admin")
//            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
//                
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//        }

        
    }
    
    
    @IBAction func startTapped(sender : AnyObject) {
        print("Start was tapped; Calling Api")
        handleQuestions()
        self.performSegueWithIdentifier("AfterAPI", sender: true)
    
    }
}


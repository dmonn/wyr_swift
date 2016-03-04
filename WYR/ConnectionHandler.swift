//
//  ConnectionHandler.swift
//  WYR
//
//  Created by Dominic Monn on 26.02.16.
//  Copyright © 2016 Dominic Monn. All rights reserved.
//

import Foundation
import Alamofire


struct ConnectionHandler {
    let url = "https://wyr-api.herokuapp.com/api/"
    let user = "dominic"
    let password = "myPass2015"
    
    func getQuestions(completionHandler: (NSArray?, NSError?) -> ()){
        Alamofire.request(.GET, url+"questions/", parameters: ["format": "json"])
            .authenticate(user: user, password: password)
            .responseJSON { response in
                switch response.result {
                case .Success(let JSON):
                    let response = JSON as! [NSDictionary]
                    completionHandler(response, nil)
                case .Failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
}

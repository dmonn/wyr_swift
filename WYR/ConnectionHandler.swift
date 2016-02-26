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
    func getQuestions(){
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .authenticate(user: "Admin", password: "Admin")
            .responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization

            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}

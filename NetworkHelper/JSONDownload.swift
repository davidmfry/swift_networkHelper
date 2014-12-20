//
//  JSONDownload.swift
//  NetworkHelper
//
//  Created by David on 11/13/14.
//  Copyright (c) 2014 David Fry. All rights reserved.
//

import UIKit



class JSONDownload: NSObject
{

    
    class func getJsonData(userGivenURL:String, completionHandler:(jsonResult: NSDictionary) ->(Void))
    {
        // URL to get the data
        let url = NSURL(string: userGivenURL)
        // The shared session
        let session = NSURLSession.sharedSession()
        
        // The task we need to comeplete
        let task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
        
            let httpResponse = response as NSHTTPURLResponse
            
            // Checking HTTP Response codes
            switch httpResponse.statusCode
            {
                case 200...299:
                println("200 all is good \(response)")

                if error != nil
                {
                    println(error.localizedDescription)
                }
            
                else
                {
                    // Parse JSON Data
                    var err:NSError?
                    var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSDictionary
                    
                    if err != nil
                    {
                        println(error.localizedDescription)
                    }
                    println(jsonResult)
                    completionHandler(jsonResult: jsonResult)
                }
        
                case 400:
                    println("400 bad request \(response)")
                case 401:
                    println("401 unauthorized \(response)")
                case 403:
                    println("403 forbidden \(response)")
                case 404:
                    println("404 not found \(response)")
                case 500:
                    println("500 internal server error \(response)")
                case 550:
                    println("550 permission denied \(response)")
                default:
                    println("\(httpResponse.statusCode) and \(response)")
                
            }
            
        })
        
        task.resume()
    }
        
}

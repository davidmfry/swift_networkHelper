//
//  ViewController.swift
//  NetworkHelper
//
//  Created by David on 11/13/14.
//  Copyright (c) 2014 David Fry. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    var jsonDict: NSDictionary?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var url = "http://api.open-notify.org/iss-now.json"
        JSONDownload.getJsonData(url, completionHandler: { (jsonResult) -> (Void) in
            self.jsonDict = jsonResult
        })
        
        println(self.jsonDict)

    }
    
    



}


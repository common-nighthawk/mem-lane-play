//
//  ViewController.swift
//  pizza_post
//
//  Created by Daniel Deutsch on 6/13/14.
//  Copyright (c) 2014 Daniel Deutsch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBAction func buttonClick(sender: AnyObject) {
        println("this shit is bananas.  B-A-N-A-N-A-S!")
        
        var doug = "Doug Funny"
        
        var postString = NSString(format: "text=Pomodoro Thingy&latitude=42.889211&longitude=88.637211")
        //var postString = NSString(format: "twinkleToes=\(title)&content=\(content)&unicorns=ALLLLWAYS I WANNA BE WITH YOU")

        var postData = postString.dataUsingEncoding(NSUTF8StringEncoding)

        var url = NSURL(string: "http://young-beach-6740.herokuapp.com/memories")

        // creating post request
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue("text/xml", forHTTPHeaderField: "X-Requested-With")

        //NSLog("Hi", request.HTTPBody)
        println(request.HTTPBody)
        
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        connection.start()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  pizza_post
//
//  Created by Daniel Deutsch on 6/13/14.
//  Copyright (c) 2014 Daniel Deutsch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBAction func buttonClick(sender: UIButton) {
        println("this shit is bananas.  B-A-N-A-N-A-S!")
    
        var doug = "Doug Funny"
        
        var postString = NSString(format: "text=New Thing&latitude=42.889211&longitude=88.637211")
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
    
    
    @IBAction func clickToGet(sender: UIButton) {
        println("this shit is oranges.")
        
        var long = "42.889211"
        var lat = "88.637211"
        
        var url = NSURL(string: "http://young-beach-6740.herokuapp.com/memories?latitude=\(long)&longitude=\(lat)")
        
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.setValue("text/xml", forHTTPHeaderField: "X-Requested-With")
        
        println(request)
        
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        connection.start()
    }
    
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!) {
        println("bam")
        println(data)
        println("bam")
        var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        println("one")
        println(jsonResult)
        println("one")
        println("sassy")
        println(jsonResult["text"])
        println("sassy")
        
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        println("pop")
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


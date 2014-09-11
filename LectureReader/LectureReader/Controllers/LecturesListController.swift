//
//  ViewController.swift
//  LectureReader
//
//  Created by rad on 08.09.14.
//  Copyright (c) 2014 rad. All rights reserved.
//

import UIKit

class LecturesListController: UITableViewController {
    
    lazy var lectures:[Lecture] = {
        var res:[Lecture] = []
        let subjects:[String] = ["O языке swift", "О природе добра и зла", "O Cocoa", "О жизни", "О любви", "О том, о сем"]
        

        for i in 1...10{
            res.append(Lecture(title: "Лекция № \(i)", subject: subjects[Int(rand()) % subjects.count], url: "http:\\example.com\\lecture\(i)"))
        }
        return res
    }()
    
    func getLecture(index:Int) -> Lecture?{
        return index < lectures.count ? lectures[index] : nil
    }
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user = (0, isLoggedIn: false) //TODO: for debugging only
        
        if (!user.isLoggedIn) {
            NSLog("User was not logged in")

        	let loginController: UIViewController = UIStoryboard(name: "Authentication", bundle: nil).instantiateInitialViewController() as UIViewController
            navigationController!.presentViewController(loginController, animated: true, completion: nil)
        }
    	else
        {
            NSLog("user is already logged in")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LectureCell") as UITableViewCell

        
        if let lecture = getLecture(indexPath.row) {
            cell.textLabel?.text = lecture.title
            cell.detailTextLabel?.text = lecture.subject
        }
       
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "viewLecture" {
            if let indexPath = tableView.indexPathForSelectedRow() {
                if let lecture = getLecture(indexPath.row){
                    var dst = segue.destinationViewController as LectureViewController
                    dst.lecture = lecture
                }
            }
        }
    }
}


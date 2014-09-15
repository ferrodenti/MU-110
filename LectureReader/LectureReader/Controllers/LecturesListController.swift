//
//  ViewController.swift
//  LectureReader
//
//  Created by rad on 08.09.14.
//  Copyright (c) 2014 rad. All rights reserved.
//

import UIKit

class LecturesListController: UITableViewController {
  
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
        
        LecturesRepository.Instance.loaded = {
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LecturesRepository.Instance.lectures.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LectureCell") as UITableViewCell
        
        if let lecture = LecturesRepository.Instance.getLecture(indexPath.row) {
            cell.textLabel?.text = lecture.name
            cell.detailTextLabel?.text = lecture.descr
        }
       
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "viewLecture" {
            if let indexPath = tableView.indexPathForSelectedRow() {
                if let lecture = LecturesRepository.Instance.getLecture(indexPath.row){
                    if let dst = segue.destinationViewController as? LectureViewController {
	                    dst.lecture = lecture
                    }
                }
            }
        }
    }
}


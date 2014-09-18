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
        
        if isUserLoggedIn() {
            showLoginController()
        }

        LecturesRepository.Instance.loaded = {
            self.tableView.reloadData()
        }
    }
    
    func isUserLoggedIn() -> Bool{
        return false
    }
    
    func showLoginController(){
        let loginController: UIViewController = UIStoryboard(name: "Authentication", bundle: nil).instantiateInitialViewController() as UIViewController
        navigationController!.presentViewController(loginController, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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


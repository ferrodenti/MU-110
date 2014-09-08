//
//  ViewController.swift
//  LectureReader
//
//  Created by rad on 08.09.14.
//  Copyright (c) 2014 rad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
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
}


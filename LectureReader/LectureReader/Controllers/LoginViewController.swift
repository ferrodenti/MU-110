//
//  LoginViewController.swift
//  LectureReader
//
//  Created by rad on 08.09.14.
//  Copyright (c) 2014 rad. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    
    @IBAction func loginAction(sender: UIButton) {
        
        NSLog("Login clicked!")
        navigationController!.dismissViewControllerAnimated(true, completion: nil) //TODO: add auth logic here
    }
}

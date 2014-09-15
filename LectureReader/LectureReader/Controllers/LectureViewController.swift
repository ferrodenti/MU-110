//
//  LectureViewController.swift
//  LectureReader
//
//  Created by rad on 11.09.14.
//  Copyright (c) 2014 rad. All rights reserved.
//

import UIKit

class LectureViewController: UIViewController {

    var lecture:Lecture?
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let lecture = self.lecture {
	        navigationItem.title = lecture.name
    	    subjectLabel.text = lecture.descr
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}

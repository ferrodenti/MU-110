//
//  LecturesRepository.swift
//  LectureReader
//
//  Created by rad on 15.09.14.
//  Copyright (c) 2014 rad. All rights reserved.
//

import Foundation
import Alamofire

private let _materUpLecturesURL = "http://weekly.master-up.net/api/v1/lecture/list/"
private var _lecturesRepository: LecturesRepository?

class LecturesRepository {
    
    class var Instance: LecturesRepository {
    	if _lecturesRepository == nil {
        	_lecturesRepository = LecturesRepository()
        }
        return _lecturesRepository!
    }
    
    private var _lectures:[Lecture]?
    var lectures:[Lecture] {
        get {
            if _lectures == nil {
				_lectures = []
                
                Alamofire.request(.GET, _materUpLecturesURL).response(onLoaded)
            }
            return _lectures!
        }
    }
    
    private func onLoaded(request:NSURLRequest, response:NSHTTPURLResponse?, data:AnyObject?, error:NSError?) {
        var err: NSError?
        var lectures:[Lecture] = []
        
        if let arr = NSJSONSerialization.JSONObjectWithData(data as NSData, options: nil, error: &err) as NSArray? {
            for item in arr {
                
                if let dict = item as? NSDictionary {
                    let lecture = Lecture()
                    
                    for (key, value) in dict {
                        var keyStr = key as String
                        if keyStr == "description" {
                            keyStr = "descr"
                        }
                        
                        if (lecture.respondsToSelector(NSSelectorFromString(keyStr))) {
                            lecture.setValue(value, forKey: keyStr)
                        }
                    }
                    
                    lectures.append(lecture)
                }
            }
        }
        
        _lectures = lectures
        loaded?()
    }
    
    var loaded: (()->())?
   
    func getLecture(index:Int) -> Lecture?{
        return index < lectures.count ? lectures[index] : nil
    }
}
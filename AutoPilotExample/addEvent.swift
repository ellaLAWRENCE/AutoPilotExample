//
//  ViewController.swift
//  AutoPilotExample
//
//  Created by Ella Lawrence (student LM) on 2/26/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import UIKit
import FirebaseAuth
import EventKit

class addEvent: UIViewController, UITextFieldDelegate {
    

    var savedEventId : String = ""
    
    
    @IBOutlet weak var assignmentNameText: UITextField!
    @IBOutlet weak var durationText: UITextField!
    @IBOutlet var startDate: UIDatePicker!
    @IBOutlet var dueDate: UIDatePicker!
    @IBOutlet var addEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("addevent")
        
        assignmentNameText.delegate = self
        durationText.delegate = self
        
        assignmentNameText.becomeFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if assignmentNameText.isFirstResponder{
            durationText.becomeFirstResponder()
        }
        else{
            durationText.resignFirstResponder()
            addEventButton.isEnabled = true
        }
        
        return true
    }
    
    
    func convertTitle(title: UITextField) -> String{
        if let t = title.text{
            return t
        }
        return " "
    }
    
    func convertTime(duration: UITextField) -> Int{
        if let t = duration.text{
            return Int(t) ?? 0
        }
        return 0
    }
    
//    func convertDate(date: UITextField) -> Date{
//        if let d = date.text{
//            let dateFormatter = DateFormatter()
//            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//            return dateFormatter.date(from:d)!
//        }
//        return Date()
//    }
    
    
    
    
    @IBAction func AddEvent(_ sender: UIButton) {
        eventListTableViewData().addEventTV(new: ourEvent.init(title: convertTitle(title: assignmentNameText), duration: convertTime(duration: durationText), start: startDate.date, end: dueDate.date))
        
    }
    
        

            
            
}


    


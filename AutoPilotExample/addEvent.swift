//
//  ViewController.swift
//  AutoPilotExamplec
//
//  Created by Ella Lawrence (student LM) on 2/26/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import UIKit

class addEvent: UIViewController, UITextFieldDelegate {
    
    var savedEventId : String = ""
    var event = eventListViewController()
    var todaysEvents = Events.shared
    
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
       var splitTime : Int
        var totalDays : Int = calendar.component(.day, from: dueDate.date)-calendar.component(.day, from: startDate.date)+1
        splitTime = convertTime(duration: durationText)/totalDays
        
        var today = Date()
        
        
        for x in 0..<totalDays{
            //var calendar = Calendar.current
            var dates = DateComponents()
            
            dates.year = Calendar.current.component(.year, from: today)
            dates.month = Calendar.current.component(.month, from: today)
            dates.day = Calendar.current.component(.day, from: today)+x
            dates.timeZone = TimeZone(abbreviation: "EST") // East Standard Time
            dates.hour = Calendar.current.component(.hour, from: today)
            dates.minute = Calendar.current.component(.minute, from: today)
            
            
            todaysEvents.addDay(daysEvents: OurEventObject.init(title: convertTitle(title: assignmentNameText), duration: splitTime, dayInBetween: Calendar.current.date(from: dates)!, end: dueDate.date))
            todaysEvents.setTime(t: splitTime)
        }
    
        

            
            
}

}
    


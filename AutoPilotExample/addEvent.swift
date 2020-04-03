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
    @IBOutlet weak var startDateText: UITextField!
    @IBOutlet weak var dueDateText: UITextField!
    @IBOutlet var addEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("addevent")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        assignmentNameText.delegate = self
        durationText.delegate = self
        startDateText.delegate = self
        dueDateText.delegate = self
        assignmentNameText.becomeFirstResponder()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if assignmentNameText.isFirstResponder{
            durationText.becomeFirstResponder()
        }
        else if durationText.isFirstResponder{
            startDateText.becomeFirstResponder()
        }
        else if startDateText.isFirstResponder{
            dueDateText.becomeFirstResponder()
        }
        else {
            dueDateText.resignFirstResponder()
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
    
    func convertDate(date: UITextField) -> Date{
        if let d = date.text{
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return dateFormatter.date(from:d)!
        }
        return Date()
    }
    
    @IBAction func AddEvent(_ sender: UIButton) {
        ourEvent.init(title: convertTitle(title: assignmentNameText), duration: convertTime(duration: durationText), start: convertDate(date: startDateText), end: convertDate(date: dueDateText))
    }
    
        
//
//        @IBAction func addNow(_ sender: UIButton) {
//
//            let eventStore = EKEventStore()
//
//            let startDate = NSDate()
//            let endDate = startDate.addingTimeInterval(60 * 60) // One hour
//
//            if (EKEventStore.authorizationStatus(for: .event) != EKAuthorizationStatus.authorized) {
//                eventStore.requestAccess(to: .event, completion: {
//                    granted, error in
//                    self.createEvent(eventStore: eventStore, title: "Test Event", startDate: startDate, endDate: endDate)
//                })
//            } else {
//                createEvent(eventStore: eventStore, title: "Test Event", startDate: startDate, endDate: endDate)
//            }
//
//        }
//
//        func createEvent(eventStore: EKEventStore, title: String, startDate: NSDate, endDate: NSDate) {
//
//            let event = EKEvent(eventStore: eventStore)
//
//            event.title = assignmentNameText.text
//            event.startDate = startDate as Date
//            event.endDate = endDate as Date
//            event.calendar = eventStore.defaultCalendarForNewEvents
//            do {
//                try eventStore.save(event, span: .thisEvent)
//                savedEventId = event.eventIdentifier
//            } catch {
//                print("Bad things happened")
//            }
//        }
//
//
//            var timeLeft = [Int]()
//            let dateFormatter = DateFormatter()
            
            
}


    


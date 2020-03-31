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
    
    


}

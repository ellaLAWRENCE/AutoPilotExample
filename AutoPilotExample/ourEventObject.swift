//
//  ourEventObject.swift
//  AutoPilotExample
//
//  Created by Emily Shang (student LM) on 3/6/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation
class OurEventObject{
    var eventTitle = String()
    var duration = Double()
    var dayInBetween = Date()
    var end = Date()
    
    init(title: String, duration: Double, dayInBetween: Date, end: Date){
        self.eventTitle = title
        self.duration = duration
        self.dayInBetween = dayInBetween
        self.end = end
    }
    
    init(){
        self.eventTitle = " "
        self.duration = 0
        self.dayInBetween = Date()
        self.end = Date()
    }

}

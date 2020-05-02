//
//  ourEventObject.swift
//  AutoPilotExample
//
//  Created by Emily Shang (student LM) on 3/6/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation
class ourEventObject{
    var eventTitle = String()
    var duration = Int()
    var dayInBetween = DateComponents()
    var end = Date()

    init(title: String, duration: Int, allDays: DateComponents, end: Date){
        self.eventTitle = title
        self.duration = duration
        self.dayInBetween = allDays
        self.end = end
    }

    init(){
        self.eventTitle = " "
        self.duration = 0
        self.dayInBetween = DateComponents()
        self.end = Date()
    }

}


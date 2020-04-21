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
    var start = Date()
    var end = Date()
    
    init(title: String, duration: Int, start: Date, end: Date){
        self.eventTitle = title
        self.duration = duration
        self.start = start
        self.end = end
    }
    
    init(){
        self.eventTitle = " "
        self.duration = 0
        self.start = Date()
        self.end = Date()
    }

}


//
//  Events.swift
//  AutoPilotExample
//
//  Created by Swope, Thomas on 4/30/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation

class Events{
    
    static let shared = Events()
    var events = [DaysEvents]()
    
    private init(){}
    
    func addDay(daysEvents : DaysEvents){
        events.append(daysEvents)
    }
    
    func getDaysEvent(date : Date) -> DaysEvents{
        // figure out how to make sure that you're getting the correct day!
    }
}

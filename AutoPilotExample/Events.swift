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
    var events = [ourEventObject]()

    private init(){}

    func addDay(daysEvents : ourEventObject){
        events.append(daysEvents)
    }

    func getDaysEvent(date : Date) -> [ourEventObject]{
        var a : [ourEventObject] = []
    
        for x in 0..<events.count{
            if events[x].dayInBetween == date{
                a.append(events[x])
            }
        }
    
        return a
    }

}

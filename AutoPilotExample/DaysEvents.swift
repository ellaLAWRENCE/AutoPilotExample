//
//  todaysEvents.swift
//  AutoPilotExample
//
//  Created by Ella Lawrence (student LM) on 4/20/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation
// https://learnappmaking.com/singletons-swift/
// class names should be capitalized
class DaysEvents{
    
    var date : Date
    var events : [OurEventObject]
    
    init(){
        date = Date()// figure out what date it should be on.
        events = []
    }
    
    func addEvent(new: OurEventObject){
        events.append(new)
        print("added")
        print(events[0].eventTitle)
         print("array size in addEvent = " + String(events.count))
        //print(getEvent())
      //  eventListTableViewData().reset()
    }
    
    func getEvent() -> [OurEventObject]{
        print ("gotten")
        print("array size in gotEvent() = " + String(events.count))
        return events
    }
    
}

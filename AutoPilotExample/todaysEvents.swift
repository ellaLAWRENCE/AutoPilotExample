//
//  todaysEvents.swift
//  AutoPilotExample
//
//  Created by Ella Lawrence (student LM) on 4/20/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation

class todaysEvents{
    
    var events :[ourEventObject] = []
    
    func addEvent(new: ourEventObject){
        events.append(new)
        print("added")
        //print(getEvent())
        eventListTableViewData().reset()
    }
    
    func getEvent() -> [ourEventObject]{
        print ("gotten")
        return events
    }
    
}

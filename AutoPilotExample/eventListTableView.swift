//
//  eventListTableView.swift
//  AutoPilotExample
//
//  Created by Emily Shang (student LM) on 3/9/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation
import UIKit

class EventListTableViewData: NSObject, UITableViewDataSource{
    
    // where is todayEvents() initialized. This would seem to be an empty or even nil object?
    // I could be wrong but it seems like your constructing a todaysEvents object here and trying to getEvents, but this object will not have any events. There doesn't seem to  be a 'connection' between this object and the todaysEvents in eventListViewController. So what I think is happening is that you initialize a new todaysEvents object here, which would have an empty array. What you think is happening is that you're getting a reference to the same todaysEvents object that you use elsewhere. What you'll need to do is create a single todaysEvents object that you reference from all classes throughout your project.
    var todayEvent : [OurEventObject] = DaysEvents().getEvent()
    
    override init(){
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayEvent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.font = UIFont(name: "helvetica neue", size: 87)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = todayEvent[indexPath.row].eventTitle + "   " + String(todayEvent[indexPath.row].duration) + "hr"
        cell.textLabel?.text = todayEvent[indexPath.row].eventTitle
        print("completed this")
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func reset(){
        todayEvent = DaysEvents().events
        print("reset")
        
    }
    
}

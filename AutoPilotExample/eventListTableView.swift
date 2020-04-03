//
//  eventListTableView.swift
//  AutoPilotExample
//
//  Created by Emily Shang (student LM) on 3/9/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation
import UIKit

class eventListTableViewData:  NSObject, UITableViewDataSource{
    
    var todayEvents: [ourEvent] = []
    
    override init(){
    }
    
    func addEvent(new: ourEvent) {
        todayEvents.append(new)
        print("added")
        print(todayEvents[0].eventTitle)
    }
    
    func getEvents() -> [ourEvent] {
        return todayEvents
        
    }
    
    func display() -> String{
            return todayEvents[0].eventTitle
    
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.font = UIFont(name: "helvetica neue", size: 18)
        cell.textLabel?.textAlignment = .center
    
    cell.textLabel?.text = display()
   
       // print(eventListViewController().getTitle(row: 0))
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

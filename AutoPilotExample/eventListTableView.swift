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
    
    func addEventTV(new: ourEvent) {
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
        return todayEvents.count-1
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cell.textLabel?.font = UIFont(name: "helvetica neue", size: 40)
        //cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = "hello"
//        cell.textLabel?.text = eventListViewController().getTitle(row: indexPath.row+1)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

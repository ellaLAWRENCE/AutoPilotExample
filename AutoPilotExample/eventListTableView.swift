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
//        for x in 0..<eventListViewController().getEvents().count{
//            todayEvents.append(eventListViewController().getEvents()[x])
//        }
        
//        todayEvents.append(ourEvent.init(title: "test", duration: 5, start: Date(), end: Date()))
//        todayEvents.append(ourEvent.init(title: "plz", duration: 5, start: Date(), end: Date()))
//        todayEvents.append(ourEvent.init(title: "work", duration: 5, start: Date(), end: Date()))
//        todayEvents.append(ourEvent.init(title: "why", duration: 5, start: Date(), end: Date()))
        
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(todayEvents.count)
        return todayEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            cell.textLabel?.font = UIFont(name: "helvetica neue", size: 87)
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = todayEvents[indexPath.row].eventTitle
            return cell
          
      }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

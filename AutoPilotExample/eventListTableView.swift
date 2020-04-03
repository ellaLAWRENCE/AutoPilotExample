//
//  eventListTableView.swift
//  AutoPilotExample
//
//  Created by Emily Shang (student LM) on 3/9/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation
import UIKit

class eventListTableViewData: NSObject, UITableViewDataSource{
    
    var todayEvent : [ourEvent] = eventListViewController().getEvents()
    
    override init(){
        todayEvent.append(ourEvent.init(title: "test", duration: 2, start: Date(), end: Date()))
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayEvent.count
    }
    
   func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.font = UIFont(name: "helvetica neue", size: 18)
        cell.textLabel?.textAlignment = .center
    
    cell.textLabel?.text = todayEvent[indexPath.row].eventTitle
   
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

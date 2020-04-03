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
        
        todayEvents.append(ourEvent.init(title: "study", duration: 2, start: Date(), end: Date()))
        todayEvents.append(ourEvent.init(title: "essay", duration: 4, start: Date(), end: Date()))
        todayEvents.append(ourEvent.init(title: "math hw", duration: 1, start: Date(), end: Date()))
       
        
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(todayEvents.count)
        return todayEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
        cell.backgroundColor = #colorLiteral(red: 0.4392250952, green: 0.4392250952, blue: 0.4392250952, alpha: 1)
            cell.textLabel?.font = UIFont(name: "helvetica neue", size: 50)
            cell.textLabel?.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = todayEvents[indexPath.row].eventTitle + "   " + String(todayEvents[indexPath.row].duration) + "hr"
            return cell
          
      }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

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
    var e = todaysEvents().events
    var todayEvent = todaysEvents().getEvent()
    
    override init(){
    }
    
    func reset(){
        e = todaysEvents().events
        print("idk")
        print(e)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayEvent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.font = UIFont(name: "helvetica neue", size: 87)
    cell.textLabel?.textAlignment = .center
//            cell.textLabel?.text = todayEvent[indexPath.row].eventTitle + "   " + String(todayEvent[indexPath.row].duration) + "hr"
         cell.textLabel?.text = todayEvent[indexPath.row].eventTitle
        print("goes here")
            return cell
          
      }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}

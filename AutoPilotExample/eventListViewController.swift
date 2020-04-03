//
//  eventListViewController.swift
//  AutoPilotExample
//
//  Created by Emily Shang (student LM) on 3/6/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import UIKit
import EventKit

class eventListViewController: UIViewController, UITableViewDelegate {

    var todayEvents :  [ourEvent] = []
    
    @IBOutlet var object: eventListTableViewData!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.reloadData()
    }
    
//    func addEventVC(new: ourEvent) {
//        todayEvents.append(new)
//        print("added")
//        //print(todayEvents[0].eventTitle)
//    }
    
    func getEvents() -> [ourEvent] {
        return todayEvents
        
    }
    
    func getTitle(row: Int) -> String {
        return todayEvents[row].eventTitle
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print (indexPath)
        table.reloadData()
    }
}

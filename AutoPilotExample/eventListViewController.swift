//
//  eventListViewController.swift
//  AutoPilotExample
//
//  Created by Emily Shang (student LM) on 3/6/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import UIKit
import EventKit

class EventListViewController: UIViewController, UITableViewDelegate {

    //var todayEvents :  [ourEventObject] = []
    
    @IBOutlet var object: eventListTableViewData!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // table.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath)
       // table.reloadData()
    }
}

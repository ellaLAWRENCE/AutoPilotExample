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
    
    func tableView(_tableView: UITableView, numberOfRowsinSection section: Int ) -> Int {return todayEvent.size}{
    
    }
    
    func tableView(_tableView: UITableView, self.rowAtIndexPath: IndexPath) -> UITableViewCell {let cell = UITableViewCell()
        cell.textLabel?.font = UIFont(name: "helvetica neue", size: 18)
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = todayEvent [indexPath.row+1]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

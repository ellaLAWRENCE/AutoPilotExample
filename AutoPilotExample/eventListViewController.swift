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


    @IBOutlet var theDate: UILabel!
    var today = Date()
    var dates = DateComponents()
    var daysUp : Int = 1
    var daysBack : Int = 1
    var upToCurrentDay : Int = 0
    var downToCurrentDay : Int = 0

    @IBOutlet var object: eventListTableViewData!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        theDate.text = formatter1.string(from: today)
        
        dates.year = Calendar.current.component(.year, from: today)
        dates.month = Calendar.current.component(.month, from: today)
        dates.day = Calendar.current.component(.day, from: today)
        dates.timeZone = TimeZone(abbreviation: "EST") // East Standard Time
        dates.hour = Calendar.current.component(.hour, from: today)
        dates.minute = Calendar.current.component(.minute, from: today)

//        theDate.text = "\(String(describing: dates.month))/\(String(describing: dates.day))/\(String(describing: dates.year))"
    }
    
    
    @IBAction func Next(_ sender: UIButton) {
        dates.day = Calendar.current.component(.day, from: today) + daysUp - downToCurrentDay
        daysUp += 1
        upToCurrentDay += 1
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        theDate.text = formatter1.string(from: Calendar.current.date(from: dates)!)
        
        //theDate.text = "\(String(describing: dates.month))/\(String(describing: dates.day))/\(String(describing: dates.year))"
        
    }
    
    @IBAction func Back(_ sender: UIButton) {
        dates.day = Calendar.current.component(.day, from: today) - daysBack + upToCurrentDay
        daysBack += 1
        downToCurrentDay += 1
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        theDate.text = formatter1.string(from: Calendar.current.date(from: dates)!)
        
        //theDate.text = "\(String(describing: dates.month))/\(String(describing: dates.day))/\(String(describing: dates.year))"
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(indexPath)
       // table.reloadData()
    }
}

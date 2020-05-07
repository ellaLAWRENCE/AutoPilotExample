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

    var count = 0
//    var timer :Timer = Timer

    
    
    var breakOptions : [String] = []
    
    @IBOutlet var mentalHealthBreak: UILabel!
    @IBOutlet var workingOnLabel: UILabel!
    @IBOutlet var theDate: UILabel!
   
    var todaysEvents = Events.shared
    var changingDay = DateShowing.shared
    
    var today = Date()
    var dates = DateComponents()
    var daysUp : Int = 1
    var daysBack : Int = 1
    var upToCurrentDay : Int = 0
    var downToCurrentDay : Int = 0
    

    var change = DateShowing.shared
    
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
        
       
        
        if todaysEvents.getDaysEvent(date: changingDay.getDay()).isEmpty{
            todaysEvents.create()
        }
        mentalHealthBreak.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        mentalHealthBreak.textColor = UIColor.white
        
        breakOptions.append("Take a break to walk around")
        breakOptions.append("Stand up and stretch")
        breakOptions.append("Take ten deep breaths and meditate")
        breakOptions.append("Talk to a friend")
        breakOptions.append("Ingage in a quick easy craft")
        breakOptions.append("Drink a glass of water")
        breakOptions.append("Have a laugh... Someone stole my mood ring, I don't know how I feel about that")
        breakOptions.append("Have a laugh... I tried to catch fog yesterday, Mist")
        breakOptions.append("Have a laugh... What did the pirate say when he turned 80? Aye Matey")
        
//        timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(implementBreak), userInfo: nil, repeats: true)
        
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { timer in
            self.count += 1
            
            if self.count%45 == 0{
                self.mentalHealthBreak.isHidden = false
                self.mentalHealthBreak.text = self.breakOptions[Int.random(in: 0..<9)]
            }
            else if self.count%50 == 0{
                self.mentalHealthBreak.isHidden = true
                self.count = 0
            }
        }
    }
    
    
    @IBAction func Next(_ sender: UIButton) {
        dates.day = Calendar.current.component(.day, from: today) + daysUp - downToCurrentDay
        daysUp += 1
        upToCurrentDay += 1
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        theDate.text = formatter1.string(from: Calendar.current.date(from: dates)!)

        change.changeDay(change: dates)
        workingOnLabel.text = "   "
        todaysEvents.reset()
        table.reloadData()

        //theDate.text = "\(String(describing: dates.month))/\(String(describing: dates.day))/\(String(describing: dates.year))"
        
    }
    
    @IBAction func Back(_ sender: UIButton) {
        dates.day = Calendar.current.component(.day, from: today) - daysBack + upToCurrentDay
        daysBack += 1
        downToCurrentDay += 1
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        theDate.text = formatter1.string(from: Calendar.current.date(from: dates)!)
        
        change.changeDay(change: dates)
        workingOnLabel.text = "   "
        todaysEvents.reset()
        table.reloadData()

        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        workingOnLabel.text = "\(todaysEvents.getDaysEvent(date: changingDay.getDay())[indexPath.row].eventTitle)"
        
        
        
    }
    
   
    
}

//
//  Events.swift
//  AutoPilotExample
//
//  Created by Swope, Thomas on 4/30/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation

class Events{

    static let shared = Events()
    var events = [OurEventObject]()
    var time : [Double] = []

    
    var dates = DateComponents()
    var today = Date()
    var length = 0.0
    var beforeHours = 9
    var beforeMin = 00
    
    private init(){}

    func addDay(daysEvents : OurEventObject){
        events.append(daysEvents)
    }

    func getDaysEvent(date : Date) -> [OurEventObject]{
        var a : [OurEventObject] = []
        var dates = DateComponents()
        
        dates.year = Calendar.current.component(.year, from: date)
        dates.month = Calendar.current.component(.month, from: date)
        dates.day = Calendar.current.component(.day, from: date)
        dates.timeZone = TimeZone(abbreviation: "EST") // East Standard Time
        dates.hour = Calendar.current.component(.hour, from: date)
        dates.minute = Calendar.current.component(.minute, from: date)
        
        var compare = DateComponents()
        
        for x in 0..<events.count{
            compare.year = Calendar.current.component(.year, from: events[x].dayInBetween)
            compare.month = Calendar.current.component(.month, from: events[x].dayInBetween)
            compare.day = Calendar.current.component(.day, from: events[x].dayInBetween)
            compare.timeZone = TimeZone(abbreviation: "EST") // East Standard Time
            compare.hour = Calendar.current.component(.hour, from: events[x].dayInBetween)
            compare.minute = Calendar.current.component(.minute, from: events[x].dayInBetween)
            
            if compare.day == dates.day{
                a.append(events[x])
            }
        }
        
        return a
    }
    
    func setTime(t: Double){
        time.append(t)
    }
    func getTime(date : Date) -> [Double]{
        var a : [Double] = []
        var dates = DateComponents()
        
        dates.year = Calendar.current.component(.year, from: date)
        dates.month = Calendar.current.component(.month, from: date)
        dates.day = Calendar.current.component(.day, from: date)
        dates.timeZone = TimeZone(abbreviation: "EST") // East Standard Time
        dates.hour = Calendar.current.component(.hour, from: date)
        dates.minute = Calendar.current.component(.minute, from: date)
        
        var compare = DateComponents()
        
        for x in 0..<events.count{
            compare.year = Calendar.current.component(.year, from: events[x].dayInBetween)
            compare.month = Calendar.current.component(.month, from: events[x].dayInBetween)
            compare.day = Calendar.current.component(.day, from: events[x].dayInBetween)
            compare.timeZone = TimeZone(abbreviation: "EST") // East Standard Time
            compare.hour = Calendar.current.component(.hour, from: events[x].dayInBetween)
            compare.minute = Calendar.current.component(.minute, from: events[x].dayInBetween)
            
            if compare.day == dates.day{
                a.append(time[x])
            }
        }
        
        return a
    }
    
    
    
    
    
    func create() {
        dates.year = Calendar.current.component(.year, from: today)
        dates.month = Calendar.current.component(.month, from: today)
        dates.day = Calendar.current.component(.day, from: today)+4
        dates.timeZone = TimeZone(abbreviation: "EST") // East Standard Time
        dates.hour = Calendar.current.component(.hour, from: today)
        dates.minute = Calendar.current.component(.minute, from: today)
           
           
        addEvent().add(t: "Spanish Project", d: 7.0, s: today, e: Calendar.current.date(from: dates)!)
        dates.day = Calendar.current.component(.day, from: today)+9
        addEvent().add(t: "Physics Project", d: 7.0, s: today, e: Calendar.current.date(from: dates)!)
        dates.day = Calendar.current.component(.day, from: today)+3
        addEvent().add(t: "Math Homework", d: 7.0, s: today, e: Calendar.current.date(from: dates)!)
        dates.day = Calendar.current.component(.day, from: today)+1
        addEvent().add(t: "Spanish Homework", d: 7.0, s: today, e: Calendar.current.date(from: dates)!)
        dates.day = Calendar.current.component(.day, from: today)+7
        addEvent().add(t: "Study for History", d: 7.0, s: today, e: Calendar.current.date(from: dates)!)
        dates.day = Calendar.current.component(.day, from: today)+8
        addEvent().add(t: "Read Ch 5", d: 7.0, s: today, e: Calendar.current.date(from: dates)!)
        dates.day = Calendar.current.component(.day, from: today)+21
        addEvent().add(t: "English Essay", d: 7.0, s: today, e: Calendar.current.date(from: dates)!)
    }

    
    func time(date: Date, row: Int) -> String{
        var s = ""
        if row == 0{
            s = "9:00"
            length = getDaysEvent(date: date)[row].duration
            
        }
        else{
            var hours = (Int(length*60))/60
            var min = Int(length*60)%60
            
            if min+beforeMin >= 60{
                hours += (min+beforeMin)/60
                min = (min+beforeMin)%60
            }
            
            if min < 10{
                s = "\(beforeHours+hours):0\(min)"
            }
            else{
               s = "\(beforeHours+hours):\(min)"
            }
            beforeHours = beforeHours+hours
            beforeMin = min
            length = getDaysEvent(date: date)[row].duration
        }
        
        
        return s
    }
   
    func reset(){
        beforeHours = 9
        beforeMin = 00
        length = 0.0
    }
}

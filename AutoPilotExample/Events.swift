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
   
    
    private init(){
        
    }

    func addDay(daysEvents : OurEventObject){
        events.append(daysEvents)
    }

    func getDaysEvent(date : Date) -> [OurEventObject]{
        var a : [OurEventObject] = []
    
        for x in 0..<events.count{
            if events[x].dayInBetween == date{
                a.append(events[x])
            }
        }
    
        return a
    }
    
    func setTime(t: Double){
        time.append(t)
    }
    func getTime() -> [Double]{
        var a : [Double] = []
        var today = Date()
        var dates = DateComponents()
        
        dates.year = Calendar.current.component(.year, from: today)
        dates.month = Calendar.current.component(.month, from: today)
        dates.day = Calendar.current.component(.day, from: today)
        dates.timeZone = TimeZone(abbreviation: "EST") // East Standard Time
        dates.hour = Calendar.current.component(.hour, from: today)
        dates.minute = Calendar.current.component(.minute, from: today)
        
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
    
    func getEvent() -> [OurEventObject]{
        var a : [OurEventObject] = []
        var today = Date()
        var dates = DateComponents()
        
        dates.year = Calendar.current.component(.year, from: today)
        dates.month = Calendar.current.component(.month, from: today)
        dates.day = Calendar.current.component(.day, from: today)
        dates.timeZone = TimeZone(abbreviation: "EST") // East Standard Time
        dates.hour = Calendar.current.component(.hour, from: today)
        dates.minute = Calendar.current.component(.minute, from: today)
        
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

}

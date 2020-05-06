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

    private init(){}

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

}

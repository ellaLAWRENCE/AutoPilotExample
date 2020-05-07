//
//  DateShowing.swift
//  AutoPilotExample
//
//  Created by Ella Lawrence (student LM) on 5/6/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation

class DateShowing{
    
    static let shared = DateShowing()
    var day = Date() 
    
    private init(){}
    
    func changeDay(change: DateComponents){
        day = Calendar.current.date(from: change)!
        print(day)
        
    }
    
    func getDay() -> Date{
        return day
    }
}

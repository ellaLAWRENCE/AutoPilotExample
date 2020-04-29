//
//  CalendarVars.swift
//  AutoPilotExample
//
//  Created by Ella Lawrence (student LM) on 4/29/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current

let day = calendar.component(.day, from: date)
let weekday = calendar.component(.weekday, from: date)
let months = calendar.component(.month, from: date) - 1
let year = calendar.component(.year, from: date)

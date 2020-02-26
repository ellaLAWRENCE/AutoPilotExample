//
//  Calendar.swift
//  calendar
//
//  Created by Emily Shang (student LM) on 1/15/20.
//  Copyright © 2020 Emily Shang (student LM). All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current
let day = calendar.component(.day, from: date)
let weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)

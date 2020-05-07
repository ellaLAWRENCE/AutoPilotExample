//
//  Stopwatch.swift
//  AutoPilotExample
//
//  Created by Ella Lawrence (student LM) on 5/6/20.
//  Copyright © 2020 Ella Lawrence (student LM). All rights reserved.
//

import Foundation

class Stopwatch{
    
    private var startTime: Date?
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime{
            return -startTime.timeIntervalSinceNow
        }
        else{
            return 0
        }
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start(){
        startTime = Date()
    }
    func stop(){
        startTime = nil
    }
    
}

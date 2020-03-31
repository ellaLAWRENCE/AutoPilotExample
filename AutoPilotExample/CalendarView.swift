//
//  CalendarView.swift
//  calendar
//
//  Created by Emily Shang (student LM) on 1/15/20.
//  Copyright © 2020 Emily Shang (student LM). All rights reserved.
//

import UIKit

class CalendarView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var MonthLabel: UILabel!
    @IBOutlet weak var Controller: UICollectionView!
    let Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "November", "December"]
    let DaysOfMonths = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var DaysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var currentMonth = String()
    var NumberOfEmptyBox = Int()
    var NextNumberofEmptyBox = Int()
    var PreviousNumberofEmptyBox = 0
    var Direction = 0
    var PositionIndex = 0
    var LeapYearCounter = 4
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Direction{
        case 0:
            return DaysInMonths[month] + NumberOfEmptyBox
        case 1...:
            return DaysInMonths[month] + NextNumberofEmptyBox
        case -1:
            return DaysInMonths[month] + PreviousNumberofEmptyBox
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DataCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.DataLabel.textColor = UIColor.black
        if cell.isHidden{
            cell.isHidden = false
        }
        switch Direction{
        case 0:
            cell.DataLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
        case 1:
            cell.DataLabel.text = "\(indexPath.row + 1 - NextNumberofEmptyBox)"
        case -1:
            cell.DataLabel.text = "\(indexPath.row + 1 - PreviousNumberofEmptyBox)"
        default:
            fatalError()
        }
        
        if Int(cell.DataLabel.text!)! < 1{
            cell.isHidden = true
        }
        switch indexPath.row {
        case 5, 6, 12, 13, 19, 20, 26, 27, 33, 34:
            if Int(cell.DataLabel.text!)! > 0 {
                cell.DataLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
        if currentMonth == Months[calendar.component(.month, from: date)-1] && year == calendar.component(.year, from: date) && indexPath.row + 1 == day{
            cell.backgroundColor = UIColor.red
        }
        return cell
        
    }
    
    @IBAction func Next(_ sender: Any) {
        switch currentMonth{
        case "December":
            month = 0
            year += 1
            Direction = 1
            
            
            if LeapYearCounter == 4{
                DaysInMonths[1] = 29
            }
            if LeapYearCounter < 5{
                LeapYearCounter+=1
            }
            if LeapYearCounter == 5{
                LeapYearCounter=1
                DaysInMonths[1] = 28
            }
            
            GetStartDataDayPosition()
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Controller.reloadData()
        default:
            Direction = 1
            GetStartDataDayPosition()
            month += 1
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Controller.reloadData()
        }
    }
    @IBAction func Back(_ sender: Any) {
        switch currentMonth{
        case "January":
            month = 11
            year -= 1
            Direction = -1
            
            if LeapYearCounter > 0 {
                LeapYearCounter-=1
            }
            if LeapYearCounter == 0{
                DaysInMonths[1] = 29
                LeapYearCounter=4
            }
            else {
                DaysInMonths[1] = 28
            }
            
            
            GetStartDataDayPosition()
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Controller.reloadData()
        default:
            month -= 1
            Direction = -1
            GetStartDataDayPosition()
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            Controller.reloadData()
        }
    }
    func GetStartDataDayPosition(){
        switch Direction{
        case 0:
        switch day{
        case 1...7:
            NumberOfEmptyBox = weekday - day
        case 0...14:
            NumberOfEmptyBox = weekday - day - 7
        case 15...21:
            NumberOfEmptyBox = weekday - day - 14
        case 22...28:
            NumberOfEmptyBox = weekday - day - 21
        case 29...31:
            NumberOfEmptyBox = weekday - day - 28
        default:
            break
            }
            PositionIndex = NumberOfEmptyBox
            
        case 1...:
            NextNumberofEmptyBox = (PositionIndex + DaysInMonths[month])%7
            PositionIndex = NextNumberofEmptyBox
        case -1:
            PreviousNumberofEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
            if PreviousNumberofEmptyBox == 7{
                PreviousNumberofEmptyBox = 0
            }
            PositionIndex = PreviousNumberofEmptyBox
        default:
            fatalError()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = Months[month]
        MonthLabel.text = "\(currentMonth) \(year)"
        
    }

}


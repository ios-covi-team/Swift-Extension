//
//  Date.swift
//  TimeTable
//
//  Created by Mr.Robo on 1/3/18.
//  Copyright © 2018 eXNodes. All rights reserved.
//

import Foundation
extension Date{
    static let dateFormat  = "dd/MM/yyyy"
    static let dateFormat1  = "yyyy-MM-dd"
    static let dateFormat2  = "yyyy-MM-dd'T'HH:mm:ss"
    static let dateFormat3  = "EE-dd-MMM-yyyy"
    static let dateFormat4  = "yyyy-MM-dd HH:mm:ss"
    static let dateFormat5  = "MMMM-yyyy"
    static let dateFormat6  = "dd MMM HH:mm"
    static let dateFormat7  = "EE dd MMM yyyy"
    static let dateFormat8  = "dd MMM yy"
    static let dateFormat9  = "dd MMM yyyy"

    static let maximumWeekOfYeer = 52

    func currentYear() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let year =  components.year
        return year!
    }
    
    func dateComponents(date:Date) -> DateComponents {
        var calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([.year,.month,.day,.hour, .minute, .second,.weekOfYear])
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let components = calendar.dateComponents(unitFlags, from: date)
        return components
    }
    
    func toString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Date.dateFormat4
        return dateFormatter.string(from: self)
    }
    
    func toString(date:Date, format:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        return dateFormatter.string(from: date as Date)
    }
    
    func toString1(date:Date, format:String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let gmt = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.timeZone = gmt as TimeZone
        return dateFormatter.string(from: date as Date)
    }

    func getDateFromString(DateStr:String?, format:String)-> Date?
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let date = dateFormatter.date(from: DateStr ?? "") ?? Date()
        
        return date
    }
    
    func getDateFromStringWithGMT(DateStr: String?, format:String)-> Date?
    {
        // create dateFormatter with UTC time format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let date = dateFormatter.date(from: DateStr!)
        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone.local
        let timeStamp = dateFormatter.string(from: date!)
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        return dateFormatter.date(from: timeStamp) ?? Date()
    }
    
    func getWeekOfYear(date:Date?) -> Int {
        if let date = date{
            var calendar = Calendar.current
            calendar.firstWeekday = 2
            return calendar.component(.weekOfYear, from: date)
        }
        return 0
    }
    
    func getDate(weekNumber:Int, currentYear:Int)->String{
        var newWeekNumber = weekNumber
        var newYear = currentYear
        

        if newWeekNumber > Date.maximumWeekOfYeer {
            newWeekNumber -= Date.maximumWeekOfYeer
            newYear += 1
        }else if newWeekNumber == 0{
            newWeekNumber = 1
        }
        
        var calendar = Calendar.current
        calendar.firstWeekday = 2
        // monday
        // iso 8601
        var components = DateComponents()
        components.yearForWeekOfYear = newYear
        components.weekOfYear = newWeekNumber
        components.weekday = 2
        // monday
        let date: Date? = calendar.date(from: components)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Date.dateFormat2
        return String(dateFormatter.string(from: date!))
    }

    var milisecond:TimeInterval{
        return self.timeIntervalSince1970 * 1000.0
    }
    
    func timeAgoDisplay() -> String {
  
        let todayComponents = dateComponents(date: today()!)
        let datetimeComponents = dateComponents(date: self)
        let minutes = Int((today()?.timeIntervalSince(self))! / 60) + 1
        

        if minutes <= 10 {
            return "Just now"
        }else if todayComponents.year == datetimeComponents.year && todayComponents.month == datetimeComponents.month && todayComponents.day == datetimeComponents.day{
            let hour =  String().validateNautralNumber(number: datetimeComponents.hour!)
            let minute =  String().validateNautralNumber(number: datetimeComponents.minute!)
            return "Today \(hour):\(minute)"
            
        }/*else if todayComponents.year! == datetimeComponents.year! && todayComponents.month! == datetimeComponents.month! && todayComponents.day! > datetimeComponents.day!{
            let hour =  String().validateNautralNumber(number: datetimeComponents.hour!)
            let minute =  String().validateNautralNumber(number: datetimeComponents.minute!)
            return "Yesterday \(hour):\(minute)"
        }*/else{
            let stringDate = toString1(date: self, format: Date.dateFormat9)
            return stringDate
        }
        
    }
    
    
     func today() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Date.dateFormat4
        let currentDateTimeString = dateFormatter.string(from: Date())
        let gmt = NSTimeZone(forSecondsFromGMT: 0)
        dateFormatter.timeZone = gmt as TimeZone
        let today: Date? = dateFormatter.date(from: currentDateTimeString)
        return today
    }

    var startOfWeek: Date? {
        var gregorian = Calendar.current
        gregorian.firstWeekday = 2
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }
    
    var endOfWeek: Date? {
        var gregorian = Calendar.current
        gregorian.firstWeekday = 2
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 7, to: sunday)
    }
    
    func dateWithIntervalFromNow(_ interval: Int) -> Date {
        return Date(timeIntervalSinceNow: TimeInterval(exactly: interval)!)
    }
    
    func dateWithInterval(_ interval: Int, fromDate date: Date) -> Date {
        return date.addingTimeInterval(TimeInterval(exactly: interval)! )
    }
    
    var startOfDay : Date {
        let calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([.year, .month, .day])
        let components = calendar.dateComponents(unitFlags, from: self)
        return calendar.date(from: components)!
    }
    
    var endOfDay : Date {
        var components = dateComponents(date: self)
        
        components.hour = 23
        components.minute = 59
        components.second = 59
        components.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        let date = Calendar.current.date(from: components)
        return date!
    }
    
    var endOfDay1 : Date {
        var components = dateComponents(date: self)
        components.hour = 0
        components.minute = 0
        components.second = 0
        components.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        let date = Calendar.current.date(from: components)
        return date!
    }
    
}

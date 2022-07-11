//
//  CalendarHelper.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 06.07.2022.
//

import Foundation
import UIKit

class CalendarHelper
{
	let calendar = Calendar.current
	
    //Add and subtract month value when button pressed
	func plusMonth(date: Date) -> Date
	{
		return calendar.date(byAdding: .month, value: 1, to: date)!
	}
	func minusMonth(date: Date) -> Date
	{
		return calendar.date(byAdding: .month, value: -1, to: date)!
	}
	
    // return corresponding month, year or day string value of date
	func monthString(date: Date) -> String
	{
		let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
		dateFormatter.dateFormat = "LLLL"
        
		return dateFormatter.string(from: date)
	}
	func yearString(date: Date) -> String
	{
		let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
		dateFormatter.dateFormat = "yyyy"
        
		return dateFormatter.string(from: date)
	}
    func dayString(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        
        return dateFormatter.string(from: date)
    }
	
 
	func daysInMonth(date: Date) -> Int
	{
		let range = calendar.range(of: .day, in: .month, for: date)!
        
		return range.count
	}
	func dayOfMonth(date: Date) -> Int
	{
		let components = calendar.dateComponents([.day], from: date)
        
		return components.day!
	}
	func firstOfMonth(date: Date) -> Date
	{
		let components = calendar.dateComponents([.year, .month], from: date)
        
		return calendar.date(from: components)!
	}
	func weekDay(date: Date) -> Int
	{
		let components = calendar.dateComponents([.weekday], from: date)
        
		return components.weekday! - 1
	}
    
    // creates a string value of date
    func compileDate(date: Date, day: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let pressedData = "\(dateFormatter.string(from: date))"
        let subDay = substituteDay(oldDate: pressedData, newDay: day)
        let cutString = pressedData.dropLast(2)
        let result = cutString + subDay
        
        return String(result)
    }
    
    // check if the date is first month on war (February)
    func isFirstMonth(date: Date) -> Bool{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let pressedData = "\(dateFormatter.string(from: date))"
        let regex = try! NSRegularExpression(pattern: "(2022)-(02)-")
        let mathces = regex.matches(in: pressedData, range: NSRange(location: 0, length: pressedData.utf16.count))
        if mathces.first != nil{
            return true
        }
        
        return false
    }
    
    // string mamipulation to convert strings from e.g. "9" to "09"
    func substituteDay(oldDate: String, newDay: String) -> String{
        var newZeroDay = ""
        if Int(newDay)! < 10 {
            newZeroDay = "0" + newDay
            return newZeroDay
        }
        
        return newDay
    }
	
}

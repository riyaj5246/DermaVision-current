//
//  CalendarHelper.swift
//  DermaVision
//
//  Created by Riya Jain on 3/24/22.
//

import Foundation

import UIKit



class CalendarHelper

{

    let calendar = Calendar.current

    

    func plusMonth(date: Date) -> Date//take a date and returns a date

    {

        return calendar.date(byAdding: .month, value: 1, to: date)!

    }

    

    func minusMonth(date: Date) -> Date//take a date and returns previous date

    {

        return calendar.date(byAdding: .month, value: -1, to: date)!

    }

    

    func monthString(date: Date) -> String//returns month

    {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "LLLL"

        return dateFormatter.string(from: date)

    }

    

    func yearString(date: Date) -> String//returns year

    {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy"

        return dateFormatter.string(from: date)

    }

    

    func timeString(date: Date) -> String

    {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "HH:mm"

        return dateFormatter.string(from: date)

    }

    

    func daysInMonth(date: Date) -> Int//returns any days in given month(31 in Jan, etc.)

    {

        let range = calendar.range(of: .day, in: .month, for: date)!

        return range.count

    }

    

    func dayOfMonth(date: Date) -> Int//returns day of month, given date, will return day of month

    //Given Janurary 2, 2020, returns 2

    {

        let components = calendar.dateComponents([.day], from: date)

        return components.day!

    }

    

    func firstOfMonth(date: Date) -> Date//gives first day of month given date

    {

        let components = calendar.dateComponents([.year, .month], from: date)

        return calendar.date(from: components)!

    }

    

    func weekDay(date: Date) -> Int//given date, gives what day of week it is

    {

        let components = calendar.dateComponents([.weekday], from: date)

        return components.weekday! - 1

    }

    

    func addDays(date: Date, days: Int) -> Date

    {

        return calendar.date(byAdding: .day, value: days, to: date)!

    }

    

    func sundayForDate(date: Date) -> Date//find date of nearest Sunday

    {

        var current = date

        let oneWeekAgo = addDays(date: current, days: -7)//7 days agp

        

        while(current > oneWeekAgo)

        {

            let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday

            if(currentWeekDay == 1)//first day of week

            {

                return current

            }

            current = addDays(date: current, days: -1)

        }

        return current

    }

    

}

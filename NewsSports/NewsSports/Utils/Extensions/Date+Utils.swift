//
//  Date+Utils.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 01.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

extension Date
{
    mutating func addDays(n: Int)
    {
        let cal = Calendar.current
        self = cal.date(byAdding: .day, value: n, to: self)!
    }

    mutating func firstDayOfTheMonth() -> Date {
        self = Calendar.current.date(byAdding: .year, value: -1, to: self)!
        return Calendar.current.date(from:
            Calendar.current.dateComponents([.year,.month], from: self))!
    }

    mutating func getAllDays() -> [Date]
    {
        var days = [Date]()

        let calendar = Calendar.current

        let range = calendar.range(of: .day, in: .month, for: self)!

        var day = firstDayOfTheMonth()

        for _ in 1...range.count
        {
            days.append(day)
            day.addDays(n: 1)
        }

        return days
    }
}

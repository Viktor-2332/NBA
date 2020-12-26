//
//  String+Utils.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 03.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation

extension String {
    
    /// конвертирует дат, которая приходит в витде строки - в нужный формат и возвращает также строку - удобно и правильно
    func UTCToLocalString(incomingFormat: String = "yyyy-MM-dd'T'HH:mm:ss'Z'", outGoingFormat: String, localeIdentifier: String =  "en_US_POSIX") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = incomingFormat
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: localeIdentifier)
        
        let secondFormatter = DateFormatter()

        secondFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS'Z'"
        secondFormatter.timeZone = TimeZone(abbreviation: "UTC")
        secondFormatter.locale = Locale(identifier: localeIdentifier)
        if let dt = dateFormatter.date(from: self) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = outGoingFormat
            return dateFormatter.string(from: dt)
        } else if let dt = secondFormatter.date(from: self) {
            secondFormatter.timeZone = TimeZone.current
            secondFormatter.dateFormat = outGoingFormat
            return secondFormatter.string(from: dt)
        }
        assertionFailure("Date was not converted")
        return ""
    }
}

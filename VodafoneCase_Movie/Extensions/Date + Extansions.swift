//
//  Date + Extansions.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 14.03.2023.
//

import Foundation


extension String {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: self)!
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = tempLocale // reset the locale
        return dateFormatter.string(from: date)
    }
}


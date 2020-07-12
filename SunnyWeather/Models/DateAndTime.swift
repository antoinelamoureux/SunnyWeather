//
//  DateAndTime.swift
//  SunnyWeather
//
//  Created by admin on 12/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import Foundation

class DateAndTime {
    func getHourForDate(_ date: Date?) -> String {
        guard let inputDate = date else { return  "" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.locale = Locale(identifier: "us_US")
        return dateFormatter.string(from: inputDate)
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else { return  "" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: inputDate)
    }
}

//
//  WeatherIcon.swift
//  Sunny Weather
//
//  Created by admin on 10/06/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import Foundation

class WeatherIcon {
    var iconSelected: String!
    
    func weatherIconSet(icon: String) -> String{
        switch icon {
        case "01d":
            iconSelected = "cloud.sun.rain"
        case "02d":
            iconSelected = "cloud.sun"
        case "03d":
            iconSelected = "cloud.fill"
        case "04d":
            iconSelected = "cloud.rain.fill"
        case "09d":
            iconSelected = "cloud.sun.rain"
        case "10d":
            iconSelected = "cloud.sun.rain"
        case "11d":
            iconSelected = "cloud.sun.rain"
        case "13d":
            iconSelected = "cloud.sun.rain"
        case "50d":
            iconSelected = "sun.haze"
        case "01n":
            iconSelected = "cloud.sun.rain"
        case "02n":
            iconSelected = "cloud.sun"
        case "03n":
            iconSelected = "cloud.fill"
        case "04n":
            iconSelected = "cloud.rain.fill"
        case "09n":
            iconSelected = "cloud.sun.rain"
        case "10n":
            iconSelected = "cloud.sun.rain"
        case "11n":
            iconSelected = "cloud.sun.rain"
        case "13n":
            iconSelected = "cloud.sun.rain"
        case "50n":
            iconSelected = "sun.haze"
        default:
            iconSelected = "sun.min"
        }
        
        return iconSelected
    }
}

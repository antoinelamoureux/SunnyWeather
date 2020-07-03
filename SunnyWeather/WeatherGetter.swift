//
//  ViewController.swift
//  Sunny Weather
//
//  Created by admin on 09/06/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import Foundation

class WeatherGetter {
    func getWeather(city: String, model: WeatherModel) {
    
        let openWeatherMapAPIKey = "0b153cc5d92060174bdf208bc5cfa2a1"
          
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?\(city)&APPID=\(openWeatherMapAPIKey)")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in

          guard let data = data else { return }
          do {
            
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(WeatherModel.self, from: data)
            
            } catch let parseErr {
            print("JSON Parsing Error", parseErr)
            }
            })
                
            task.resume()
            }
}

//
//  ViewController.swift
//  Sunny Weather
//
//  Created by admin on 09/06/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import Foundation

class WeatherGetter {
    var currentWeather: Empty?
    var errorMessage = ""
    
        func weatherData(from url: URL, completion: @escaping () -> ()) {
            URLSession.shared.dataTask(with: url) { (data, response, error ) in
                guard let data = data else { return }
                self.updateResults(data)
                completion()
            }.resume()
        }
        
        func updateResults(_ data: Data) {
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let rawFeed = try decoder.decode(Empty.self, from: data)
                currentWeather = rawFeed
            } catch let decodeError as NSError {
                errorMessage += "Decoder error: \(decodeError.localizedDescription)"
                print(errorMessage)
                return
            }
        }
        
    func getResults(city: String, completionHandler: @escaping (Empty?) -> Void)  {
            let openWeatherMapAPIKey = "0b153cc5d92060174bdf208bc5cfa2a1"
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(openWeatherMapAPIKey)")
        
        weatherData(from: url!) {
                DispatchQueue.main.async {
                    let weather = self.currentWeather
                    completionHandler(weather)
                }
            }
        }
    }



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let empty = try? newJSONDecoder().decode(Empty.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.emptyTask(with: url) { empty, response, error in
//     if let empty = empty {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Empty
struct Empty: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
    
    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly, daily
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.currentTask(with: url) { current, response, error in
//     if let current = current {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Current
struct Current: Codable {
    let dt, sunrise, sunset: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.weatherTask(with: url) { weather, response, error in
//     if let weather = weather {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: Main
    let weatherDescription: Description
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.dailyTask(with: url) { daily, response, error in
//     if let daily = daily {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Daily
struct Daily: Codable {
    let dt, sunrise, sunset: Int
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let clouds: Int
    let uvi: Double
    let rain: Double?
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather, clouds, uvi, rain
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.feelsLikeTask(with: url) { feelsLike, response, error in
//     if let feelsLike = feelsLike {
//       ...
//     }
//   }
//   task.resume()

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.tempTask(with: url) { temp, response, error in
//     if let temp = temp {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.hourlyTask(with: url) { hourly, response, error in
//     if let hourly = hourly {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Hourly
struct Hourly: Codable {
    let dt: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint: Double
    let clouds: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case clouds
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func emptyTask(with url: URL, completionHandler: @escaping (Empty?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}

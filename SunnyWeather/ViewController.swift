//
//  ViewController.swift
//  SunnyWeather
//
//  Created by admin on 03/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let weatherGetter = WeatherGetter()
    
    let cityName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let temperature: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(cityName)
        view.addSubview(temperature)
        
        weatherGetter.getResults(city: "Paris,fr", completionHandler: { weather in
            self.cityName.text = weather?.name
            self.temperature.text = String(format: "%.0f", (weather?.main.temp ?? 0.0) - 273.15)
            self.temperature.text? += "°C"
        })
        
        setupLayout()
    }
    
    private func setupLayout() {
        cityName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityName.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        cityName.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cityName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        temperature.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        temperature.topAnchor.constraint(equalTo: cityName.bottomAnchor, constant: 50).isActive = true
        temperature.widthAnchor.constraint(equalToConstant: 100).isActive = true
        temperature.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}


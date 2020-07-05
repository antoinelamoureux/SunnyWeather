//
//  MainTableViewCell.swift
//  SunnyWeather
//
//  Created by admin on 04/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cityName)
        contentView.addSubview(temperature)
        
        weatherGetter.getResults(city: "Paris,fr", completionHandler: { weather in
            self.cityName.text = weather?.name
            self.cityName.font = UIFont.boldSystemFont(ofSize: 45.0)
            self.cityName.textColor = .darkGray
            self.temperature.text = String(format: "%.0f", (weather?.main.temp ?? 0.0) - 273.15)
            self.temperature.text? += "°C"
            self.temperature.font = UIFont.systemFont(ofSize: 25.0)
            self.temperature.textColor = .darkGray
        })
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    private func setupLayout() {
        contentView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        cityName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        cityName.bottomAnchor.constraint(equalTo: temperature.topAnchor, constant: -10).isActive = true
        cityName.widthAnchor.constraint(equalToConstant: 100).isActive = true
        cityName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        temperature.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        temperature.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        temperature.widthAnchor.constraint(equalToConstant: 100).isActive = true
        temperature.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

}

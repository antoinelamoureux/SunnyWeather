//
//  TodayCollectionViewCell.swift
//  SunnyWeather
//
//  Created by admin on 05/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import UIKit

class TodayCollectionViewCell: UICollectionViewCell {
    let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.init(hue: 0.55, saturation: 0.1, brightness: 1, alpha: 1)
        layer.cornerRadius = 10
        
        contentView.addSubview(cityLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(tempLabel)
        
        let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=Paris,fr&APPID=0b153cc5d92060174bdf208bc5cfa2a1")
        
        let task = URLSession.shared.weatherModelTask(with: url!) { weatherModel, response, error in
            if let weatherModel = weatherModel {
                DispatchQueue.main.async {
                    self.cityLabel.text = "cities"
                    self.iconImageView.image = UIImage(systemName: "cloud.sun")
                    self.tempLabel.text = String(format: "%.0f", weatherModel.main.tempMin  - 273.15) + "/" + String(format: "%.0f", weatherModel.main.tempMax  - 273.15)
                    self.tempLabel.text? += "°C"
                }
            }
        }
        task.resume()
        
        setupLayout()
    }
    
    private func setupLayout() {
        cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tempLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let detailsButton: UIButton = {
        let button = UIButton.init(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show Details", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(detailsTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(cityName)
        contentView.addSubview(temperature)
        contentView.addSubview(iconImageView)
        contentView.addSubview(detailsButton)
        
        let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=Paris,fr&APPID=0b153cc5d92060174bdf208bc5cfa2a1")
        
        let task = URLSession.shared.weatherModelTask(with: url!) { weatherModel, response, error in
             if let weatherModel = weatherModel {
                DispatchQueue.main.async {
                self.cityName.text = weatherModel.name
                self.cityName.font = UIFont.boldSystemFont(ofSize: 45.0)
                self.cityName.textColor = .darkGray
                self.temperature.text = String(format: "%.0f", (weatherModel.main.temp) - 273.15)
                self.temperature.text? += "°C"
                self.temperature.font = UIFont.systemFont(ofSize: 25.0)
                    self.temperature.textColor = .darkGray
                self.iconImageView.image = UIImage(systemName: "cloud.sun")
                }
             }
           }
           task.resume()
        
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
        iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        iconImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        detailsButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        detailsButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        detailsButton.rightAnchor.constraint(equalTo: iconImageView.rightAnchor).isActive = true
        detailsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20).isActive = true
        
    }
    
    @objc func detailsTapped() {
        
    }

}

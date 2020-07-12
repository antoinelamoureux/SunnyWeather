//
//  TodayTableViewCell.swift
//  SunnyWeather
//
//  Created by admin on 04/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import UIKit

class TodayTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let dateAndTime = DateAndTime()
    let weatherIcon = WeatherIcon()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        setupLayout()
    }
    
    private func setupLayout() {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 150), collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        layout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        contentView.addSubview(collectionView)
        
        collectionView.register(TodayCollectionViewCell.self, forCellWithReuseIdentifier: "TodayCollectionViewCell")
        
        contentView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodayCollectionViewCell", for: indexPath) as! TodayCollectionViewCell
        let url = URL(string:"https://api.openweathermap.org/data/2.5/onecall?lat=48.8534&lon=2.3488&appid=0b153cc5d92060174bdf208bc5cfa2a1")
        
        let task = URLSession.shared.emptyTask(with: url!) { empty, response, error in
            if let empty = empty {
                DispatchQueue.main.async {
                    let hour = self.dateAndTime.getHourForDate(Date(timeIntervalSince1970: Double(empty.hourly[indexPath.row].dt)))
                    cell.cityLabel.text = hour
                    cell.iconImageView.image = UIImage(systemName: "\(self.weatherIcon.weatherIconSet(icon: empty.hourly[indexPath.row].weather[0].icon))")
                    cell.tempLabel.text = String(format: "%.0f", empty.hourly[indexPath.row].temp - 273.15)
                    cell.tempLabel.text? += "°C"
                }
            }
        }
        task.resume()
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

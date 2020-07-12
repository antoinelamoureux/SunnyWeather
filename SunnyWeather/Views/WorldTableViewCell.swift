//
//  WordTableViewCell.swift
//  SunnyWeather
//
//  Created by admin on 04/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import UIKit

class WorldTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    let weatherIcon = WeatherIcon()

    let cities = ["Paris,fr", "London,uk", "Berlin,de", "Rome,it", "Madrid,es", "Beijing,cn", "Brazilia,br", "Tokyo,jp"]

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
        
        collectionView.register(WorldCollectionViewCell.self, forCellWithReuseIdentifier: "WorldCollectionViewCell")
        
        contentView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorldCollectionViewCell", for: indexPath) as! WorldCollectionViewCell
        
        let url = URL(string:"https://api.openweathermap.org/data/2.5/onecall?lat=48.8534&lon=2.3488&appid=0b153cc5d92060174bdf208bc5cfa2a1")
        
        let task = URLSession.shared.emptyTask(with: url!) { empty, response, error in
            if let empty = empty {
                DispatchQueue.main.async {
                    cell.cityLabel.text = "Chicago"
                    cell.iconImageView.image = UIImage(systemName: "\(self.weatherIcon.weatherIconSet(icon: empty.current.weather[0].icon))")
                    cell.tempLabel.text = String(format: "%.0f", empty.current.temp - 273.15)
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

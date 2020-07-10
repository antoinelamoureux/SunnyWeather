//
//  WorldCollectionViewCell.swift
//  SunnyWeather
//
//  Created by admin on 10/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import UIKit

class WorldCollectionViewCell: UICollectionViewCell {
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
        backgroundColor = UIColor.init(hue: 0.15, saturation: 0.4, brightness: 1, alpha: 1)
        layer.cornerRadius = 10
        
        contentView.addSubview(cityLabel)
        contentView.addSubview(iconImageView)
        contentView.addSubview(tempLabel)
        
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

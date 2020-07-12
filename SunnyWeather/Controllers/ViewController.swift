//
//  ViewController.swift
//  SunnyWeather
//
//  Created by admin on 03/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    var safeArea: UILayoutGuide!
    let dateAndTime = DateAndTime()
    let weatherIcon = WeatherIcon()
    
    var sections = ["", "Today", "This Week", "In the World"]
    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    override func loadView() {
        super.loadView()
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.compactAppearance?.shadowColor = .clear
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableView.register(TodayTableViewCell.self, forCellReuseIdentifier: "TodayTableViewCell")
        tableView.register(WeekTableViewCell.self, forCellReuseIdentifier: "WeekTableViewCell")
        tableView.register(WorldTableViewCell.self, forCellReuseIdentifier: "WorldTableViewCell")
        
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        setupLayout()
    }
    
    
    private func setupLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        headerView.backgroundColor = .clear
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = sections[section]
        label.font = .boldSystemFont(ofSize: 20)
        headerView.addSubview(label)
        label.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(25)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = .clear
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(15)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections[section] == "This Week" {
            return days.count
        } else {
        return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections[indexPath.section] == "" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
            cell.contentView.isUserInteractionEnabled = true;
            cell.detailsButton.addTarget(self, action: #selector(detailsTapped), for: .touchUpInside)
            cell.selectionStyle = .none
            return cell
        } else if sections[indexPath.section] == "Today" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTableViewCell", for: indexPath) as! TodayTableViewCell
            return cell
        } else if sections[indexPath.section] == "This Week" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeekTableViewCell", for: indexPath) as! WeekTableViewCell
            let iconImageView = UIImageView.init(frame: CGRect(x:-20, y:0, width:35, height:25))
            iconImageView.image = UIImage(systemName: "cloud.sun")
            let label = UILabel.init(frame: CGRect(x:-200, y:0, width:135, height:35))
            
            let url = URL(string:"https://api.openweathermap.org/data/2.5/onecall?lat=48.8534&lon=2.3488&appid=0b153cc5d92060174bdf208bc5cfa2a1")
            
            let task = URLSession.shared.emptyTask(with: url!) { empty, response, error in
                if let empty = empty {
                    DispatchQueue.main.async {
                        cell.textLabel?.text = self.dateAndTime.getDayForDate(Date(timeIntervalSince1970: Double(empty.daily[indexPath.row].dt)))
                        label.textColor = .darkGray
                        label.text = String(format: "%.0f", empty.daily[indexPath.row].temp.day - 273.15)
                        label.text? += "° "
                        label.text? += empty.daily[indexPath.row].weather[0].weatherDescription.rawValue
                        iconImageView.image = UIImage(systemName: "\(self.weatherIcon.weatherIconSet(icon: empty.daily[indexPath.row].weather[0].icon))")
                    }
                }
            }
            task.resume()
            
            iconImageView.addSubview(label)
            cell.accessoryView = iconImageView
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorldTableViewCell", for: indexPath) as! WorldTableViewCell
            return cell
        }
    }
    
    @objc func detailsTapped() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}



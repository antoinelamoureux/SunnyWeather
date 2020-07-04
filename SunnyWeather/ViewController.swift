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
    
    var sections = ["", "Today", "This Week", "In the World"]

    override func loadView() {
        super.loadView()
        
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
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
        headerView.backgroundColor = .white
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = sections[section]
        label.font = .boldSystemFont(ofSize: 20)
        headerView.addSubview(label)
        label.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(35)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if sections[indexPath.section] == "" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
            return cell
        } else if sections[indexPath.section] == "Today" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTableViewCell", for: indexPath) as! TodayTableViewCell
            return cell
        } else if sections[indexPath.section] == "This Week" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeekTableViewCell", for: indexPath) as! WeekTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorldTableViewCell", for: indexPath) as! WorldTableViewCell
            return cell
        }
    }
}



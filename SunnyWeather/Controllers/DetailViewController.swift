//
//  DetailViewController.swift
//  SunnyWeather
//
//  Created by admin on 11/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.standardAppearance.backgroundColor = .white
        navigationController?.navigationBar.compactAppearance?.shadowColor = .none
        navigationController?.navigationBar.standardAppearance.shadowColor = .none
        navigationController?.navigationBar.scrollEdgeAppearance?.shadowColor = .none
        navigationController?.isNavigationBarHidden = false
    }
    
}

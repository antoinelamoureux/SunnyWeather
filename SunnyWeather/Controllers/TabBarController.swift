//
//  TabBarController.swift
//  SunnyWeather
//
//  Created by admin on 12/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = .white
        tabBar.standardAppearance.shadowColor = .none
        tabBar.standardAppearance.backgroundColor = .white
        tabBar.clipsToBounds = true
        tabBar.isTranslucent = false

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

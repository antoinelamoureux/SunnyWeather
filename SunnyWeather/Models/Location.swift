//
//  LocationData.swift
//  SunnyWeather
//
//  Created by admin on 12/07/2020.
//  Copyright © 2020 Antoine Lamoureux. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class Location: NSObject, CLLocationManagerDelegate  {
    let locationManager = CLLocationManager()

    func getLocation() -> Coordinates {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        let latitude = Double(locationManager.location?.coordinate.latitude ?? 0)
        let longitude = Double(locationManager.location?.coordinate.longitude ?? 0)
        
        let location = Coordinates(latitude: latitude, longitude: longitude)
        
        return location
    }
}

//
//  LocationProvider.swift
//  UnitSample
//
//  Created by New User on 11/12/19.
//  Copyright © 2019 New User. All rights reserved.
//

import Foundation
import CoreLocation


class LocationProvider:NSObject{
    
    private var locationManager:LocationFetcher
    private var currentLocationCallback:((CLLocation) -> Void)?
    
    
    required init(locationManager:LocationFetcher = CLLocationManager()){
        self.locationManager = locationManager
        super.init()
        self.locationManager.desiredAccuracy = .leastNormalMagnitude
        self.locationManager.locationFetcherDelegate = self
    }
    
    func checkCurrentLocation(completion:@escaping (Bool)->Void){
        self.currentLocationCallback = {location in
            completion(true)
            
        }
        locationManager.requestLocation()
    }
    
}

extension LocationProvider:LocationFetcherDelegate{
    func locationFetcher(_ fetcher: LocationFetcher, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        
        self.currentLocationCallback?(location)
        self.currentLocationCallback = nil
    }
    
    
}

extension LocationProvider:CLLocationManagerDelegate{
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationFetcher(manager, didUpdateLocations: locations)
    }
    
}

protocol LocationFetcherDelegate {
    func locationFetcher(_ fetcher:LocationFetcher,didUpdateLocations locations:[CLLocation])
}

protocol LocationFetcher {
    var locationFetcherDelegate:LocationFetcherDelegate? {get set}
    var desiredAccuracy:CLLocationAccuracy {get set}
    func requestLocation()
}


extension CLLocationManager:LocationFetcher{
    var locationFetcherDelegate: LocationFetcherDelegate? {
        get {
            return delegate as! LocationFetcherDelegate?
        }
        set {
            delegate = newValue as! CLLocationManagerDelegate?
        }
    }
    
    
}

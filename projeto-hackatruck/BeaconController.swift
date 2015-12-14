//
//  BeaconController.swift
//  projeto-hackatruck
//
//  Created by Student on 14/12/15.
//  Copyright © 2015 organization. All rights reserved.
//

import CoreLocation


class BeaconController: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Estimotes")
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestAuthorization() {
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func start() {
        locationManager.startRangingBeaconsInRegion(region)
    }
    
    func stop() {
        locationManager.stopMonitoringForRegion(region)
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let nearestBeacon = beacons
            .filter({ $0.proximity == CLProximity.Near && $0.accuracy <= 1.2 })
            .sort({ $0.accuracy < $1.accuracy })
            .first

        if let beacon = nearestBeacon {
            doAnything(beacon)
        }
    }
    
    func doAnything(beacon: CLBeacon) {
        print(beacon.accuracy)
    }
}

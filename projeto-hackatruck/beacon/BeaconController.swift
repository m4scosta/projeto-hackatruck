//
//  BeaconController.swift
//  projeto-hackatruck
//
//  Created by Marcos Costa Pinto on 14/12/15.
//  Copyright © 2015 Eye Way. All rights reserved.
//

import CoreLocation


class BeaconController: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()

    private let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Estimotes")
    
    private var lastNearestBeacon: CLBeacon?
    
    private var working = false
    
    var delegate: BeaconControllerDelegate?

    static let instance = BeaconController()
    
    private override init() {
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
        print("Ranging started")
    }

    func stop() {
        locationManager.stopMonitoringForRegion(region)
        print("Ranging stopped")
    }
    
    func toggle() {
        if !working {
            requestAuthorization()
            start()
        } else {
            stop()
        }
        
        working = !working
    }

    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        let nearestBeacon = beacons
            .filter({ $0.proximity != CLProximity.Unknown && $0.accuracy <= 1.2 })
            .sort({ $0.accuracy < $1.accuracy })
            .first

        guard let beacon = nearestBeacon else {
            return
        }
        
        if isNewNearestBeacon(beacon) {
            lastNearestBeacon = beacon
            delegate?.nearestBeacon(beacon)
        }
    }
    
    private func isNewNearestBeacon(beacon: CLBeacon) -> Bool {
        return lastNearestBeacon == nil ||
            (beacon.minor != lastNearestBeacon?.minor || beacon.major != lastNearestBeacon?.major)
    }
}

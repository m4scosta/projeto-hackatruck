//
//  BeaconControllerDelegate.swift
//  projeto-hackatruck
//
//  Created by Marcos Costa Pinto on 16/12/15.
//  Copyright © 2015 Eye Way. All rights reserved.
//

import CoreLocation

protocol BeaconControllerDelegate {
    
    func nearestBeacon(nearestBeacon: CLBeacon)
}

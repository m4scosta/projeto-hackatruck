//
//  SpeechService.swift
//  projeto-hackatruck
//
//  Created by Student on 16/12/15.
//  Copyright © 2015 organization. All rights reserved.
//

import CoreLocation
import AVFoundation

class SpeechService: BeaconControllerDelegate {
    
    let synth = AVSpeechSynthesizer()
    
    func speak(utterance: AVSpeechUtterance) {
        synth.speakUtterance(utterance)
    }
    
    func nearestBeacon(nearestBeacon: CLBeacon, section: Section) {
        speak(AVSpeechUtterance(string: "Você está próximo da seção de \(section.name)"))
    }
}

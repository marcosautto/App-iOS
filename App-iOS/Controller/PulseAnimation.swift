//
//  PulseAnimation.swift
//  App-iOS
//
//  Created by Francesco Picone on 24/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import Foundation
import UIKit

extension   UIButton {
    
    //prova commit assets
    func pulsate() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 10
        pulse.fromValue = 0.97
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 100000
        pulse.initialVelocity = 0.5
        pulse.damping = 0.5
        pulse.mass = 1
        
        layer.add(pulse, forKey: "pulse")
    }
    
    func pulsateStop(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0
        pulse.fromValue = 0.97
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 0
        pulse.initialVelocity = 0.5
        pulse.damping = 0.5
        pulse.mass = 1
        
        layer.add(pulse, forKey: "pulse")
    }
}

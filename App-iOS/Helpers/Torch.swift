//
//  Torch.swift
//  App-iOS
//
//  Created by Andrea Lombardi on 01/10/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import Foundation
import AVFoundation

func toggleTorch(on: Bool) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }
    
    if device.hasTorch {
        do {
            try device.lockForConfiguration()
            
            if on == true {
                device.torchMode = .on
            } else {
                device.torchMode = .off
            }
            
            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    } else {
        print("Torch is not available")
    }

}



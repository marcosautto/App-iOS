//
//  AKPlaygroundLoop.swift
//  App-iOS
//
//  Created by Marco Sautto on 25/09/18.
//  Copyright © 2018 musicaecoding. All rights reserved.
//  AudioClass123345467

import Foundation
import AudioKit

public class AKPlaygroundLoop: NSObject {
    private var internalHandler: () -> Void = {}
    private var duration = 1.0
    
    /// Repeat this loop at a given period with a code block
    ///
    /// - parameter every: Period, or interval between block executions
    /// - parameter handler: Code block to execute
    ///
    @objc public init(every dur: Double, handler: @escaping () -> Void) {
        duration = dur
        internalHandler = handler
        super.init()
        update()
    }
    
    /// Repeat this loop at a given frequency with a code block
    ///
    /// - parameter frequency: Frequency of block executions in Hz
    /// - parameter handler: Code block to execute
    ///
    @objc public init(frequency: Double, handler: @escaping () -> Void) {
        duration = 1.0 / frequency
        internalHandler = handler
        super.init()
        update()
    }
    
    /// Callback function
    @objc func update() {
        self.internalHandler()
        self.perform(#selector(update),
                     with: nil,
                     afterDelay: duration,
                     inModes: [RunLoop.Mode.common])
        
    }
}

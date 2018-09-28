//
//  secondsToMinuteAndSeconds.swift
//  App-iOS
//
//  Created by Marco Sautto on 27/09/2018.
//  Copyright © 2018 musicaecoding. All rights reserved.
//

import Foundation
//
func secondsToHoursMinutesSeconds (inputSeconds : Int) -> String {
    let seconds = (inputSeconds % 3600) % 60
    let minutes = (inputSeconds % 3600) / 60
    let timeString = ("\(minutes)"+":"+"\(seconds)")
    return timeString
}

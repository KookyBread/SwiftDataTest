//
//  WorkoutHeartZone.swift
//  Me
//
//  Created by 刘弨 on 2024/6/23.
//

import Foundation
import SwiftData

@Model
class WorkoutHeartZoneData{
    @Attribute(.unique) var id: UUID
    var zone1: TimeInterval
    var zone2: TimeInterval
    var zone3: TimeInterval
    var zone4: TimeInterval
    var zone5: TimeInterval
    var upDatetime: Date
    
    init(id: UUID, zone1: TimeInterval = 0, zone2: TimeInterval = 0, zone3: TimeInterval = 0, zone4: TimeInterval = 0, zone5: TimeInterval = 0, upDatetime: Date = .now) {
        self.id = id
        self.zone1 = zone1
        self.zone2 = zone2
        self.zone3 = zone3
        self.zone4 = zone4
        self.zone5 = zone5
        self.upDatetime = upDatetime
    }
}

//
//  HeartZoneData.swift
//  Me
//
//  Created by 刘弨 on 2024/6/19.
//

import Foundation
import SwiftData

@Model
class HeartZoneData{
    var monthAvgRHRValue: Int
    var yearMaxHRValue: Int
    var zone1max: Int
    var zone2min: Int
    var zone2max: Int
    var zone3min: Int
    var zone3max: Int
    var zone4min: Int
    var zone4max: Int
    var zone5min: Int
    var startDate: Date
    var upDatetime: Date
    
    init(monthAvgRHRValue: Int = 0, yearMaxHRValue: Int = 0, zone1max: Int = 0, zone2min: Int = 0, zone2max: Int = 0, zone3min: Int = 0, zone3max: Int = 0, zone4min: Int = 0, zone4max: Int = 0, zone5min: Int = 0, startDate: Date = .now,upDatetime: Date = .now) {
        self.monthAvgRHRValue = monthAvgRHRValue
        self.yearMaxHRValue = yearMaxHRValue
        self.zone1max = zone1max
        self.zone2min = zone2min
        self.zone2max = zone2max
        self.zone3min = zone3min
        self.zone3max = zone3max
        self.zone4min = zone4min
        self.zone4max = zone4max
        self.zone5min = zone5min
        self.startDate = startDate
        self.upDatetime = upDatetime
    }
}

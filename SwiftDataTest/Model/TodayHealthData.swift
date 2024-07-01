//
//  TodayHealthData.swift
//  Me
//
//  Created by 刘弨 on 2024/3/1.
//


import Foundation
import SwiftData

@Model
class TodayHealthData{
    @Attribute(.unique) let date: String
    var steps: Double
    var hrv: [HealthData]
    var vo2max: [HealthData]
    var sleep: [SleepData]
    var inbed: [SleepData]
    var sleepDuration: TimeInterval
    var inBedDuration: TimeInterval
    
    init(date: String = "", steps: Double = 0, hrv: [HealthData] = [], vo2max:  [HealthData] = [], sleep: [SleepData] = [], inbed: [SleepData] = [], sleepDuration: TimeInterval = 0, inBedDuration: TimeInterval = 0) {
        self.date = date
        self.steps = steps
        self.hrv = hrv
        self.vo2max = vo2max
        self.sleep = sleep
        self.inbed = inbed
        self.sleepDuration = sleepDuration
        self.inBedDuration = inBedDuration
    }
}
extension TodayHealthData {
    static func predicateForType(
        searchType: String
    ) -> Predicate<TodayHealthData> {
        return #Predicate<TodayHealthData> { todayHealthData in
            todayHealthData.date.contains(searchType)
        }
    }
}

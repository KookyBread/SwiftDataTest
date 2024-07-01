//
//  HealthDataStatistics.swift
//  Me
//
//  Created by 刘弨 on 2024/1/20.
//

import Foundation
import SwiftData

@Model
class HealthDataStatistics{
    @Attribute(.unique) let healthType: String
    var lastValue: Double
    var lastValueTime: String
    var weekAvgValue: Double
    var monthAvgValue: Double
    var yearAvgValue: Double
    var monthlyAvgArray: [HealthData]
    
    init(healthType: String = "", lastValue: Double = 0, lastValueTime: String = "", weekAvgValue: Double = 0, monthAvgValue: Double = 0, yearAvgValue: Double = 0, monthlyAvgArray: [HealthData] = []) {
        self.healthType = healthType
        self.lastValue = lastValue
        self.lastValueTime = lastValueTime
        self.weekAvgValue = weekAvgValue
        self.monthAvgValue = monthAvgValue
        self.yearAvgValue = yearAvgValue
        self.monthlyAvgArray = monthlyAvgArray
    }
}
extension HealthDataStatistics {
    static func predicateForType(
        searchType: String
    ) -> Predicate<HealthDataStatistics> {
        return #Predicate<HealthDataStatistics> { healthData in
            healthData.healthType.contains(searchType)
        }
    }
}

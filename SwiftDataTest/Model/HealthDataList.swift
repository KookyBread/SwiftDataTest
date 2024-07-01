//
//  HealthDataList.swift
//  Me
//
//  Created by 刘弨 on 2024/4/20.
//

import Foundation
import SwiftData

@Model
class HealthDataList{
    @Attribute(.unique) let healthType: String
    var dailyAvgArray: [HealthData]
    var monthlyAvgArray: [HealthData]
    var weeklyAvgArray: [HealthData]
    var annualAvgArray: [HealthData]
    init(healthType: String = "" , dailyAvgArray: [HealthData] = [], weeklyAvgArray: [HealthData] = [], monthlyAvgArray: [HealthData] = [], annualAvgArray: [HealthData] = []) {
        self.healthType = healthType
        self.dailyAvgArray = dailyAvgArray
        self.weeklyAvgArray = weeklyAvgArray
        self.monthlyAvgArray = monthlyAvgArray
        self.annualAvgArray = annualAvgArray
    }

}
extension HealthDataList {
    static func predicateForType(
        searchType: String
    ) -> Predicate<HealthDataList> {
        return #Predicate<HealthDataList> { healthData in
            healthData.healthType.contains(searchType)
        }
    }
}

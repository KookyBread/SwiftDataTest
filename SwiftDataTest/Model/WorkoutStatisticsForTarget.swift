//
//  WorkoutStatisticsForTarget.swift
//  Me
//
//  Created by 刘弨 on 2024/4/13.
//

import Foundation
import SwiftData

@Model
class WorkoutStatisticsForTarget{
    @Attribute(.unique) let WorkoutType: String
    var Year: [WorkoutStatisticsData]
    var Month: [WorkoutStatisticsData]
    var Week: [WorkoutStatisticsData]
    var Day: [WorkoutStatisticsData]
    
    init(WorkoutType: String = "", Year: [WorkoutStatisticsData] = [], Month: [WorkoutStatisticsData] = [],Week: [WorkoutStatisticsData] = [], Day: [WorkoutStatisticsData] = []) {
        self.WorkoutType = WorkoutType
        self.Year = Year
        self.Month = Month
        self.Week = Week
        self.Day = Day
    }

    
}
extension WorkoutStatisticsForTarget {
    static func predicateForWorkoutType(
        searchType: String
    ) -> Predicate<WorkoutStatisticsForTarget> {
        return #Predicate<WorkoutStatisticsForTarget> { typeData in
            typeData.WorkoutType.contains(searchType)
        }
    }
}

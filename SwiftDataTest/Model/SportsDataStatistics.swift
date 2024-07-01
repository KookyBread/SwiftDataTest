//
//  SportsDataStatistics.swift
//  Me
//
//  Created by 刘弨 on 2024/1/21.
//
import Foundation
import SwiftData

@Model
class SportsDataStatistics{
    @Attribute(.unique) let workoutType: String
    var allTotalDistance: Double
    var allTotalDuration: Double
    var weekTotalDistance: Double
    var weekTotalDuration: Double
    var monthTotalDistance: Double
    var monthTotalDuration: Double
    var yearTotalDistance: Double
    var yearTotalDuration: Double
    var last12MonthDistance: [SportsData]
    var last12MonthDuration: [SportsData]
    
    init(workoutType: String = "", allTotalDistance: Double = 0, allTotalDuration: Double = 0, weekTotalDistance: Double = 0, weekTotalDuration: Double = 0, monthTotalDistance: Double = 0, monthTotalDuration: Double = 0, yearTotalDistance: Double = 0, yearTotalDuration: Double = 0, last12MonthDistance: [SportsData] = [], last12MonthDuration: [SportsData] = []) {
        self.workoutType = workoutType
        self.allTotalDistance = allTotalDistance
        self.allTotalDuration = allTotalDuration
        self.weekTotalDistance = weekTotalDistance
        self.weekTotalDuration = weekTotalDuration
        self.monthTotalDistance = monthTotalDistance
        self.monthTotalDuration = monthTotalDuration
        self.yearTotalDistance = yearTotalDistance
        self.yearTotalDuration = yearTotalDuration
        self.last12MonthDistance = last12MonthDistance
        self.last12MonthDuration = last12MonthDuration
    }
}
extension SportsDataStatistics {
    static func predicateForType(
        searchType: String
    ) -> Predicate<SportsDataStatistics> {
        return #Predicate<SportsDataStatistics> { workoutData in
            workoutData.workoutType.contains(searchType)
        }
    }
}

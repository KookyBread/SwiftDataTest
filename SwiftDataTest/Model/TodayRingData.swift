//
//  TodayData.swift
//  Me
//
//  Created by 刘弨 on 2024/2/29.
//

import Foundation
import SwiftData

@Model
class TodayRingData{
    @Attribute(.unique) let date: String
    var energy: Double
    var exercise: Double
    var stand: Double
    var energyGoal: Double
    var exerciseGoal: Double
    var standGoal: Double
    var EnergyProgress: Double
    var ExerciseProgress: Double
    var StandProgress: Double
    var TodayProgress: Double
    var updateTime: Date
    
    init(date: String = "Date", energy: Double = 0, exercise: Double = 0, stand: Double = 0, energyGoal: Double = 0, exerciseGoal: Double = 0, standGoal: Double = 0, EnergyProgress: Double = 0, ExerciseProgress: Double = 0, StandProgress: Double = 0, TodayProgress: Double = 0, updateTime: Date = Date()) {
        self.date = date
        self.energy = energy
        self.exercise = exercise
        self.stand = stand
        self.energyGoal = energyGoal
        self.exerciseGoal = exerciseGoal
        self.standGoal = standGoal
        self.EnergyProgress = EnergyProgress
        self.ExerciseProgress = ExerciseProgress
        self.StandProgress = StandProgress
        self.TodayProgress = TodayProgress
        self.updateTime = updateTime
    }
}
extension TodayRingData {
    static func predicateForType(
        searchType: String
    ) -> Predicate<TodayRingData> {
        return #Predicate<TodayRingData> { todayRingData in
            todayRingData.date.contains(searchType)
        }
    }
}

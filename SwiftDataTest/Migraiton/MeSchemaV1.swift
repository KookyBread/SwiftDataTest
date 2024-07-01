//
//  MeSchemaV1.swift
//  Me
//
//  Created by 刘弨 on 2024/4/29.
//

import Foundation
import SwiftData


enum MeSchemaV1: VersionedSchema {    
    static var versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] {
        [
            WorkoutList.self,
            HealthDataStatistics.self,
            SportsDataStatistics.self,
            UserSettingTypeFor.self,
            TodayRingData.self,
            TodayHealthData.self,
            SleepDataSource.self
        ]
    }
    //MARK: - 运动列表数据
    @Model
    class WorkoutList{
        @Attribute(.unique) let id: UUID
        var StartDate: Date
        var EndDate: Date
        var WorkoutType: String
        var WorkoutIcon: String
        var WorkoutColor: String
        var WorkoutDistance: Double
        var WorkoutDuration: TimeInterval
        var WorkoutEnergy: Double
        var WorkoutAvgHR: Double
        
        init(id: UUID = UUID(), StartDate: Date = .now, EndDate: Date = .now, WorkoutType: String = "", WorkoutIcon: String = "", WorkoutColor: String = "", WorkoutDistance: Double = 0.0, WorkoutDuration: TimeInterval = 0, WorkoutEnergy: Double = 0.0, WorkoutAvgHR: Double = 0.0) {
            self.id = id
            self.StartDate = StartDate
            self.EndDate = EndDate
            self.WorkoutType = WorkoutType
            self.WorkoutIcon = WorkoutIcon
            self.WorkoutColor = WorkoutColor
            self.WorkoutDistance = WorkoutDistance
            self.WorkoutDuration = WorkoutDuration
            self.WorkoutEnergy = WorkoutEnergy
            self.WorkoutAvgHR = WorkoutAvgHR
        }
    }
    //MARK: - 健康统计数据
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
    //MARK: - 运动统计数据
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
    //MARK: - 运动类型设置数据
    @Model
    class UserSettingTypeFor{
        @Attribute(.unique) let TypeNum: String
        var TypeName: String
        var TypeIcon: String
        var TypeBGColor: String

        init(TypeNum: String = "", TypeName: String = "", TypeIcon: String = "" , TypeBGColor: String = "") {
            self.TypeNum = TypeNum
            self.TypeName = TypeName
            self.TypeIcon = TypeIcon
            self.TypeBGColor = TypeBGColor
        }
    }
    //MARK: - 今日健身圆环数据
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
    //MARK: - 今日健康数据
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
    //MARK: - 睡眠数据来源
    @Model
    class SleepDataSource{
        @Attribute(.unique) let SourceName: String
        var isSelect: Bool

        init(SourceName: String = "", isSelect: Bool = false) {
            self.SourceName = SourceName
            self.isSelect = isSelect
        }
    }
}



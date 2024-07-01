//
//  MeSchemaV4.swift
//  Me
//
//  Created by 刘弨 on 2024/6/15.
//

import Foundation
import SwiftData
import MapKit

enum MeSchemaV4: VersionedSchema {
    static var versionIdentifier = Schema.Version(4, 0, 0)
    
    static var models: [any PersistentModel.Type] {
        [
            WorkoutList.self,
            HealthDataStatistics.self,
            SportsDataStatistics.self,
            UserSettingTypeFor.self,
            TodayRingData.self,
            TodayHealthData.self,
            SleepDataSource.self,
            WorkoutTargetData.self,
            WorkoutStatisticsForTarget.self,
            HealthDataList.self,
            SleepStagesData.self,
            WorkoutDetailData.self,
            HeartZoneData.self,
            WorkoutSegmentData.self,
            WorkoutMaxMinRangeData.self,
            WorkoutHeartZoneData.self
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
        var WorkoutSource: String
        var inDoor: Int
        var mets: Double
        var elevationAscended: Double
        var maxHR:Double
        var minHR:Double
        var avgPace: TimeInterval
        var avgSwimPace: TimeInterval
        var avgSpeed: Double
        var avgStepRate: Double
        var avgStepLength: Double
        var runningPower: Double
        var runningGroundContactTime: Double
        var runningVerticalOscillation: Double
        var cyclingPower: Double
        var cyclingCadence: Double
        var humidity:Double
        var temperature: Double
        var isDetailData: Bool

        init(id: UUID = UUID(),
             StartDate: Date = .now,
             EndDate: Date = .now,
             WorkoutType: String = "",
             WorkoutIcon: String = "",
             WorkoutColor: String = "",
             WorkoutDistance: Double = 0.0,
             WorkoutDuration: TimeInterval = 0,
             WorkoutEnergy: Double = 0.0,
             WorkoutAvgHR: Double = 0.0,
             WorkoutSource: String = "",
             inDoor: Int = 0,
             mets: Double = 0.0,
             elevationAscended: Double = 0.0,
             maxHR:Double = 0.0,
             minHR:Double = 0.0,
             avgPace: TimeInterval = 0,
             avgSwimPace: TimeInterval = 0,
             avgSpeed: Double = 0.0,
             avgStepRate: Double = 0.0,
             avgStepLength: Double = 0.0,
             runningPower: Double = 0.0,
             runningGroundContactTime: Double = 0.0,
             runningVerticalOscillation: Double = 0.0,
             cyclingPower: Double = 0.0,
             cyclingCadence: Double = 0.0,
             humidity: Double = 0.0,
             temperature: Double = 0.0,
             isDetailData: Bool = false
        ){
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
            self.WorkoutSource = WorkoutSource
            self.inDoor = inDoor
            self.mets = mets
            self.elevationAscended = elevationAscended
            self.maxHR = maxHR
            self.minHR = minHR
            self.avgPace = avgPace
            self.avgSwimPace = avgSwimPace
            self.avgSpeed = avgSpeed
            self.avgStepRate = avgStepRate
            self.avgStepLength = avgStepLength
            self.runningPower = runningPower
            self.runningGroundContactTime = runningGroundContactTime
            self.runningVerticalOscillation = runningVerticalOscillation
            self.cyclingPower = cyclingPower
            self.cyclingCadence = cyclingCadence
            self.humidity = humidity
            self.temperature = temperature
            self.isDetailData = isDetailData
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
    //MARK: - 运动目标
    @Model
    class WorkoutTargetData{
        @Attribute(.unique) let WorkoutType: String
        var TargetType: String
        var TargetVlaue: Double

        init(WorkoutType: String = "", TargetType: String = "", TargetVlaue: Double = 0.0) {
            self.WorkoutType = WorkoutType
            self.TargetType = TargetType
            self.TargetVlaue = TargetVlaue
        }
    }
    
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
    
    @Model
    class SleepStagesData{
        @Attribute(.unique) let id: UUID
        var stageValue: Int
        var startDate: Date
        var endDate: Date
        var duration: TimeInterval
        var dataSource: String
        
        init(id: UUID, stageValue: Int = 0, startDate: Date = .now , endDate: Date = .now, duration: TimeInterval = 0, dataSource: String) {
            self.id = id
            self.stageValue = stageValue
            self.startDate = startDate
            self.endDate = endDate
            self.duration = duration
            self.dataSource = dataSource
        }
    }
    

    @Model
    class WorkoutDetailData{
        let id: UUID
        var statisitcsName: String
        var statisitcsArray: [SportsData]
        var maxRecords: Double
        var minRecords: Double
        var avgRecords: Double
        var upDatetime: Date
        
        init(id: UUID, statisitcsName: String = "", statisitcsArray: [SportsData] = [], maxRecords: Double = 0, minRecords: Double = 0, avgRecords: Double = 0, avgRecords2: Double = 0, upDatetime: Date = .now) {
            self.id = id
            self.statisitcsName = statisitcsName
            self.statisitcsArray = statisitcsArray
            self.maxRecords = maxRecords
            self.minRecords = minRecords
            self.avgRecords = avgRecords
            self.upDatetime = upDatetime
        }
    }
    

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
    
    @Model
    class WorkoutSegmentData{
        @Attribute(.unique) var workoutUUID: UUID
        var SegmentDuration: [Double]
        
        init(workoutUUID: UUID, SegmentDuration: [TimeInterval] = []) {
            self.workoutUUID = workoutUUID
            self.SegmentDuration = SegmentDuration
        }
    }
    
    
    @Model
    class WorkoutMaxMinRangeData{
        let id: UUID
        var statisitcsName: String
        var statisitcsArray: [HeartData]
        var maxRecords: Double
        var minRecords: Double
        var avgRecords: Double
        var upDatetime: Date
        
        init(id: UUID, statisitcsName: String = "", statisitcsArray: [HeartData] = [], maxRecords: Double = 0, minRecords: Double = 0, avgRecords: Double = 0, avgRecords2: Double = 0, upDatetime: Date = .now) {
            self.id = id
            self.statisitcsName = statisitcsName
            self.statisitcsArray = statisitcsArray
            self.maxRecords = maxRecords
            self.minRecords = minRecords
            self.avgRecords = avgRecords
            self.upDatetime = upDatetime
        }
    }

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
}

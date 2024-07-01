////
////  WorkoutList.swift
////  Me
////
////  Created by 刘弨 on 2024/1/20.
////
//
import Foundation
import SwiftData
import MapKit

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

extension WorkoutList {
    static func predicateForType(
        searchType: String
    ) -> Predicate<WorkoutList> {
        return #Predicate<WorkoutList> { workout in
            workout.WorkoutType.contains(searchType)
        }
    }
    static func predicateForUUID(
        searchID: UUID
    ) -> Predicate<WorkoutList> {
        return #Predicate<WorkoutList> { workout in
            workout.id == searchID
        }
    }
    static func predicateForDate(searchDate: Date) -> Predicate<WorkoutList> {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: searchDate)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        return #Predicate<WorkoutList> { workout in
            workout.StartDate >= startOfDay && workout.StartDate < endOfDay
        }
    }
}

//
//  SwiftDataTestApp.swift
//  SwiftDataTest
//
//  Created by 刘弨 on 2024/6/27.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTestApp: App {
    
//MARK: -V3 ModelContainer
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
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
            SleepStagesData.self
        ])
        let migrationPlan = MeMigrationPlan.self
        do {
            return try ModelContainer(for: schema, migrationPlan: migrationPlan)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
//MARK: -V4 ModelContainer
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
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
        ])
        let migrationPlan = MeMigrationPlan.self
        do {
            return try ModelContainer(for: schema, migrationPlan: migrationPlan)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

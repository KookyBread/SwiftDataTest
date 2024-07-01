//
//  MigrationPlan.swift
//  Me
//
//  Created by 刘弨 on 2024/4/29.
//

//import Foundation
//import SwiftData
//
//enum MeMigrationPlan: SchemaMigrationPlan {
//    static var schemas: [any VersionedSchema.Type] {
//        [MeSchemaV1.self, MeSchemaV2.self,MeSchemaV3.self]
//    }
//    
//    static var stages: [MigrationStage]{
//        [migrateV1toV2,migrateV2toV3]
//    }
//    
//    static let migrateV1toV2 = MigrationStage.custom(
//        fromVersion: MeSchemaV1.self,
//        toVersion: MeSchemaV2.self,
//        willMigrate: { context in
//            let todayRingData = try context.fetch(FetchDescriptor<MeSchemaV1.TodayRingData>())
//            try context.delete(model: MeSchemaV1.TodayRingData.self)
//        },
//        didMigrate: nil
//    )
////    static let migrateV2toV3 = MigrationStage.lightweight(
////        fromVersion: MeSchemaV2.self,
////        toVersion: MeSchemaV3.self
////    )
//    static let migrateV2toV3 = MigrationStage.custom(
//        fromVersion: MeSchemaV2.self,
//        toVersion: MeSchemaV3.self,
//        willMigrate: nil, didMigrate: nil
//    )
//}

import Foundation
import SwiftData

enum MeMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [MeSchemaV1.self, MeSchemaV2.self, MeSchemaV3.self, MeSchemaV4.self]
    }
    
    static var stages: [MigrationStage] {
        [migrateV1toV2, migrateV2toV3, migrateV3toV4]
    }
    
    static let migrateV1toV2 = MigrationStage.custom(
        fromVersion: MeSchemaV1.self,
        toVersion: MeSchemaV2.self,
        willMigrate: { context in
            try context.delete(model: MeSchemaV1.TodayRingData.self)
        },
        didMigrate: nil
    )

    static let migrateV2toV3 = MigrationStage.custom(
        fromVersion: MeSchemaV2.self,
        toVersion: MeSchemaV3.self,
        willMigrate: { context in
            try context.delete(model: MeSchemaV2.TodayRingData.self)
            try context.delete(model: MeSchemaV2.HealthDataStatistics.self)
            try context.delete(model: MeSchemaV2.SportsDataStatistics.self)
            try context.delete(model: MeSchemaV2.UserSettingTypeFor.self)
            try context.delete(model: MeSchemaV2.TodayRingData.self)
            try context.delete(model: MeSchemaV2.TodayHealthData.self)
            try context.delete(model: MeSchemaV2.SleepDataSource.self)
            try context.delete(model: MeSchemaV2.WorkoutTargetData.self)
            try context.delete(model: MeSchemaV2.WorkoutStatisticsForTarget.self)
            try context.delete(model: MeSchemaV2.HealthDataList.self)
        },
        didMigrate: nil
    )
    
    static let migrateV3toV4 = MigrationStage.custom(
        fromVersion: MeSchemaV3.self,
        toVersion: MeSchemaV4.self,
        willMigrate: { context in
            print("开始数据迁移")
            do {
                try context.delete(model: MeSchemaV3.WorkoutList.self)
                try context.delete(model: MeSchemaV3.HealthDataStatistics.self)
                try context.delete(model: MeSchemaV3.SportsDataStatistics.self)
                try context.delete(model: MeSchemaV3.UserSettingTypeFor.self)
                try context.delete(model: MeSchemaV3.TodayRingData.self)
                try context.delete(model: MeSchemaV3.TodayHealthData.self)
                try context.delete(model: MeSchemaV3.SleepDataSource.self)
                try context.delete(model: MeSchemaV3.WorkoutTargetData.self)
                try context.delete(model: MeSchemaV3.WorkoutStatisticsForTarget.self)
                try context.delete(model: MeSchemaV3.HealthDataList.self)
                try context.delete(model: MeSchemaV3.SleepStagesData.self)
                print("历史数据删除完毕")
                try context.save()  // 确保删除操作被保存
            } catch {
                // 处理迁移错误
                print("Migration from V3 to V4 failed with error: \(error)")
                throw error
            }
        },
        didMigrate: nil
    )
}

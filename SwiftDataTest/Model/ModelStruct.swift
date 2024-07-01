//
//  ModelWidgets.swift
//  Me
//
//  Created by 刘弨 on 2023/11/7.
//

import Foundation
import HealthKit
import SwiftUI
import SwiftData
import MapKit


struct activitySummaries: Identifiable {
    var id = UUID()
    let Date: Date
    var Records: HKActivitySummary?
}



struct HealthData: Codable,Identifiable {
    var id = UUID()
    let Date: Date
    var Records: Double
}

struct HRChartData: Codable,Identifiable {
    var id = UUID()
    let Date: Date
    var maxRecords: Double
    var minRecords: Double
}

struct SleepData: Codable,Identifiable {
    var id = UUID()
    let StartDate: Date
    let EndDate: Date
    var StatesDuration: TimeInterval
    var SleepStates: Int
    var DataSource: String
}


struct DayActivity: Codable,Identifiable{
    var id = UUID()
    let day: Int
    var hasActivity: Bool
}


struct SportsData: Codable,Identifiable,Hashable {
    var id = UUID()
    let Date: Date
    var Records: Double
}

struct HeartData: Codable,Identifiable,Hashable {
    var id = UUID()
    let Date: Date
    var MaxRecords: Double
    var MinRecords: Double
}

struct WorkoutStatisticsData: Codable,Identifiable,Hashable {
    var id = UUID()
    let Date: Date
    var DistanceRecords: Double
    var DurationRecords: Double
}

struct Last12MonthSportsData: Codable,Identifiable {
    var id = UUID()
    let Date: String
    var Records: Double
}



struct WorkoutListData: Codable,Identifiable {
    var id = UUID()
    let Date: Date
    var WorkoutType: String
    var WorkoutIcon: String
    var WorkoutColor: String
    var WorkoutDistance: Double
    var WorkoutDuration: TimeInterval
    var WorkoutEnergy: Double
    var WorkoutAvgHR: Double
}

struct HealthListData: Codable,Hashable {
    var id = UUID()
    let Date: Date
    var Records: Double
}

struct CoordinateModel: Identifiable {
    var id: UUID
    var coordinate: CLLocationCoordinate2D
}

struct zone: Identifiable {
    let id = UUID()
    let name: String
    var value: Int
}

extension TimeInterval {
    func formattedHoursAndMinutes() -> (hours: Int, minutes: Int) {
        let hours = Int(self) / 3600
        let minutes = Int(self) / 60 % 60
        return (hours, minutes)
    }
}

extension Date {
    // 比较两个日期是否在同一月份
    func isSameMonth(as otherDate: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year, .month], from: self)
        let components2 = calendar.dateComponents([.year, .month], from: otherDate)
        return components1.year == components2.year && components1.month == components2.month
    }
    // 比较两个日期是否在同一年
    func isSameYear(as otherDate: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year], from: self)
        let components2 = calendar.dateComponents([.year], from: otherDate)
        return components1.year == components2.year
    }
}

extension String {
    func localised(withComment comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}


//struct HealthDataNew: Codable,Identifiable {
//    var id = UUID()
//    let Date: Date
//    var Records: Double
//}

//MARK: - 定义进度条样式
struct RoundedRectProgressViewStyle: ProgressViewStyle {
    var height: CGFloat          // 进度条的高度
    var backgroundColor: Color   // 背景颜色
    var foregroundColors: [Color] // 前景色的颜色数组

    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: height / 2)
                    .frame(width: geometry.size.width, height: height)
                    .foregroundColor(backgroundColor.opacity(0.3))
//                    .overlay(Color.black.opacity(0.2))
                    .cornerRadius(height / 2)

                RoundedRectangle(cornerRadius: height / 2)
                    .fill(LinearGradient(gradient: Gradient(colors: foregroundColors), startPoint: .leading, endPoint: .trailing))
                    .frame(width: max(CGFloat(configuration.fractionCompleted ?? 0) * geometry.size.width, height), height: height)
            }
        }
    }
}

//
//  WorkoutTargetData.swift
//  Me
//
//  Created by 刘弨 on 2024/4/3.
//

import Foundation
import SwiftData

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
extension WorkoutTargetData {
    static func predicateForWorkoutType(
        searchType: String
    ) -> Predicate<WorkoutTargetData> {
        return #Predicate<WorkoutTargetData> { typeData in
            typeData.WorkoutType.contains(searchType)
        }
    }
}

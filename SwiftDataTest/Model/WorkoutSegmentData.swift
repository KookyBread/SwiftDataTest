//
//  WorkoutSegmentData.swift
//  Me
//
//  Created by 刘弨 on 2024/6/22.
//

import Foundation
import SwiftData

@Model
class WorkoutSegmentData{
    @Attribute(.unique) var workoutUUID: UUID
    var SegmentDuration: [Double]
    
    init(workoutUUID: UUID, SegmentDuration: [TimeInterval] = []) {
        self.workoutUUID = workoutUUID
        self.SegmentDuration = SegmentDuration
    }
}

//
//  ElevationsData.swift
//  Me
//
//  Created by 刘弨 on 2024/6/19.
//

import Foundation
import SwiftData

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

//
//  SleepData.swift
//  Me
//
//  Created by 刘弨 on 2024/5/15.
//

import Foundation
import SwiftData

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


extension SleepStagesData {
    static func predicateForUUID(
        searchID: UUID
    ) -> Predicate<SleepStagesData> {
        return #Predicate<SleepStagesData> { sleep in
            sleep.id == searchID
        }
    }
}
//@Model
//class SleepSource{
//    @Attribute(.unique) let dataSource: String
//    init(dataSource: String = "") {
//        self.dataSource = dataSource
//    }
//}

//
//  SleepDataSource.swift
//  Me
//
//  Created by 刘弨 on 2024/3/20.
//

import Foundation
import SwiftData

@Model
class SleepDataSource{
    @Attribute(.unique) let SourceName: String
    var isSelect: Bool

    init(SourceName: String = "", isSelect: Bool = false) {
        self.SourceName = SourceName
        self.isSelect = isSelect
    }
}
extension SleepDataSource {
    static func predicateForSourceName(
        searchType: String
    ) -> Predicate<SleepDataSource> {
        return #Predicate<SleepDataSource> { typeData in
            typeData.SourceName.contains(searchType)
        }
    }
}

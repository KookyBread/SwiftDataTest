//
//  MonthlyWorkoutCalendar.swift
//  Me
//
//  Created by 刘弨 on 2024/1/27.
//


//import Foundation
//import SwiftData
//
//@Model
//class MonthlyWorkoutCalendar{
//    @Attribute(.unique) var id: UUID
//    var TypeName: String
//    var day: Int
//    var isActivity: Bool
//
//    init(id: UUID, TypeName: String = "", day: Int = 0, isActivity: Bool = false) {
//        self.id = id
//        self.TypeName = TypeName
//        self.day = day
//        self.isActivity = isActivity
//    }
//}
//extension MonthlyWorkoutCalendar {
//    static func predicateForType(
//        searchType: String
//    ) -> Predicate<MonthlyWorkoutCalendar> {
//        return #Predicate<MonthlyWorkoutCalendar> { typeData in
//            typeData.TypeName.contains(searchType)
//        }
//    }
//}

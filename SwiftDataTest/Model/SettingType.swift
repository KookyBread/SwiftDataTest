//
//  SettingType.swift
//  Me
//
//  Created by 刘弨 on 2024/1/21.
//

import Foundation
import SwiftData

@Model
class UserSettingTypeFor{
    @Attribute(.unique) let TypeNum: String
    var TypeName: String
    var TypeIcon: String
    var TypeBGColor: String

    init(TypeNum: String = "", TypeName: String = "", TypeIcon: String = "" , TypeBGColor: String = "") {
        self.TypeNum = TypeNum
        self.TypeName = TypeName
        self.TypeIcon = TypeIcon
        self.TypeBGColor = TypeBGColor
    }
}
extension UserSettingTypeFor {
    static func predicateForTypeNum(
        searchType: String
    ) -> Predicate<UserSettingTypeFor> {
        return #Predicate<UserSettingTypeFor> { typeData in
            typeData.TypeNum.contains(searchType)
        }
    }
    static func predicateForTypeName(
        searchType: String
    ) -> Predicate<UserSettingTypeFor> {
        return #Predicate<UserSettingTypeFor> { typeData in
            typeData.TypeName.contains(searchType)
        }
    }
}

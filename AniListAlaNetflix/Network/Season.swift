//
//  Season.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/24/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation

/// The season the anime was initially released in.
enum Season: String {
    case winter = "WINTER"
    case spring = "SPRING"
    case summer = "SUMMER"
    case fall = "FALL"
    static let allValues = [winter, spring, summer, fall]
}

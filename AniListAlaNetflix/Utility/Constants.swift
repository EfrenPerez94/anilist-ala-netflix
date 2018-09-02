//
//  Constants.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/22/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

typealias Parameters = [String: Any]
/// Base URL to perform requests from AniList API.
let apiURL = "https://graphql.anilist.co"

/// Aspect ratio to set constraint.
let aspectRatio: CGFloat = 3 / 4

/// Palette color for the application.
extension UIColor {
    static let darkBackground = try? "0F0F0F".getColor()
    static let lightTextColor = try? "EBEBEB".getColor()
}

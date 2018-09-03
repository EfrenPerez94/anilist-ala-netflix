//
//  Constants.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/22/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation
import UIKit

/// Useful to perform graphQL querys.
typealias Parameters = [String: Any]

class Constants {
    /// Base URL to perform requests from AniList API.
    static let apiURL = "https://graphql.anilist.co"
    
    /// Aspect ratio to set constraint.
    static let aspectRatio: CGFloat = 3 / 4
}

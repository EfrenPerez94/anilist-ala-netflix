//
//  CoverImage.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/27/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation

/// Model for cover images variations.
struct CoverImage: Codable {
    let medium: String?
    let large: String?
}

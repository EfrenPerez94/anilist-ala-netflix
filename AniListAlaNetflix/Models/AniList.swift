//
//  Anime.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/26/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation

/// Model for an AniList request.
struct AniList: Codable {
    let data: File?
    let errors: [ErrorDescription]?
}

struct File: Codable {
    let page: Page?
    let media: Media?
    
    enum CodingKeys: String, CodingKey {
        case page = "Page"
        case media = "Media"
    }
}

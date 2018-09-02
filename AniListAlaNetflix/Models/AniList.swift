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
    let data: MediaData?
    let errors: [ErrorDescription]?
}

/// Model to organize data from the API.
struct MediaData: Codable {
    let page: Page?
    let media: Media?
    
    enum CodingKeys: String, CodingKey {
        case page = "Page"
        case media = "Media"
    }
}

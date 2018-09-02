//
//  Media.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/27/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation

/// Model for media from AniList.
struct Media: Codable {
    let id: Int
    let description: String?
    let siteUrl: String?
    let season: String?
    let format: String?
    let status: String?
    let episodes: Int?
    let duration: Int?
    let title: Title
    let coverImage: CoverImage
    let bannerImage: String?
    let trailer: String?
}

//
//  Page.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/27/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation

/// Model to store page data.
struct Page: Codable {
    let pageInfo: PageInfo?
    let media: [Media]?
}

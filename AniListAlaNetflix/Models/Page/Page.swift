//
//  Page.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/27/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation

struct Page: Codable {
    let pageInfo: PageInfo?
    let media: [Media]?
}

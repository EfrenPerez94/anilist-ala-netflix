//
//  ErrorDescription.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/27/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation

/// Descripton for GraphQL query errors.
struct ErrorDescription: Codable {
    let message: String
    let status: Int
}

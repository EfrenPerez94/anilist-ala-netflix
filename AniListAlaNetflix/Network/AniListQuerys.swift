//
//  AniListQuerys.swift
//  AniListAlaNetflix
//
//  Created by Efrén Pérez Bernabe on 8/24/18.
//  Copyright © 2018 Efrén Pérez Bernabe. All rights reserved.
//

import Foundation

/// Create a GraphQL query to retrieve detail information of an Anime.
///
/// - Parameter id: Needed to retrieve the specific anime.
/// - Returns: A list of parameters to perform an AniList request.
func retriveAnime(id: Int) -> Parameters {
    let variables = [ "id": id ]
    let query = """
                    query ($id: Int) {
                        Media (id: $id, type: ANIME) {
                            id
                            description(asHtml: false)
                            siteUrl
                            season
                            format
                            status
                            episodes
                            duration
                            title {
                              romaji
                              english
                            }
                            coverImage {
                                large
                            }
                            trailer {
                                site
                            }
                            characters(page: 1, perPage: 5) {
                                edges {
                                    node {
                                        name {
                                            first
                                            last
                                        }
                                    }
                                }
                            }
                        }
                    }
                """
    
    let body: Parameters = ["variables": variables, "query": query]
    return body
}

/// Create a GraphQL query to retrieve a list of Animes for season.
///
/// - Parameters:
///   - fromPage: Pagination for the list of animes.
///   - animesPerPage: Number of animes retrieve for page.
///   - season: Filter the animes for a the specific season.
/// - Returns: A list of parameters to perform an AniList request.
func retriveAnimesForSeason(fromPage: Int, animesPerPage: Int, season: Season) -> Parameters {
    let variables: Parameters = [ "page": fromPage,
                                  "perPage": animesPerPage,
                                  "season": season.rawValue ]
    let query = """
                query ($season: MediaSeason, $page: Int, $perPage: Int) {
                    Page (page: $page, perPage: $perPage) {
                        pageInfo {
                            hasNextPage
                        }
                        media (season: $season, type: ANIME) {
                            id
                            title {
                                romaji
                                english
                            }
                            coverImage {
                                medium
                            }
                        }
                    }
                }
                """
    let body: Parameters = ["variables": variables, "query": query]
    return body
}

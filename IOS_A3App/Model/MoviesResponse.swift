//
//  MoviesResponse.swift
//  IOS_A3App
//
//  Created by shihao lin on 23/5/2023.
//

import Foundation
struct MoviesResponse: Codable {
    let dates: Dates
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Dates: Codable {
    let maximum: String
    let minimum: String
}

//
//  Upcoming.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 13/02/2023.
//

import Foundation

struct UpcomingResource: Codable {
    let results: [Upcoming]
}

struct Upcoming: Codable {
    let id: Int
    let poster_path: String?
    let adult: Bool?
    let overview: String?
    let release_date: String?
    let genre_ids: [Int]
    let original_title: String?
    let original_language: String?
    let title: String?
    let backdrop_path: String?
    let popularity: Float
    let vote_count: Int?
    let video: Bool?
    let vote_average: Float
}

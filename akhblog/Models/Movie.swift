//
//  Movie.swift
//  akhblog
//
//  Created by Aung Kyaw Htay on 13/02/2023.
//

import Foundation

struct TrendingMovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double?
}

//adult = 0;
//"backdrop_path" = "/AaV1YIdWKnjAIAOe8UUKBFm327v.jpg";
//"genre_ids" =             (
//    28,
//    18
//);
//id = 361743;
//"media_type" = movie;
//"original_language" = en;
//"original_title" = "Top Gun: Maverick";
//overview = "After more than thirty years of service as one of the Navy\U2019s top aviators, and dodging the advancement in rank that would ground him, Pete \U201cMaverick\U201d Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.";
//popularity = "493.706";
//"poster_path" = "/62HCnUTziyWcpDaBO2i1DX17ljH.jpg";
//"release_date" = "2022-05-24";
//title = "Top Gun: Maverick";
//video = 0;
//"vote_average" = "8.319000000000001";
//"vote_count" = 6010;

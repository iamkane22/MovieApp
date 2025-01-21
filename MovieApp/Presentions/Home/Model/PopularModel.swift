//
//  PopularModel.swift
//  MovieApp
//
//  Created by Kenan on 13.01.25.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let popularDTO = try? JSONDecoder().decode(PopularDTO.self, from: jsonData)

import Foundation

// MARK: - PopularDTO
struct PopularDTO: Codable {
    let page: Int
    let results: [PopularResult]?
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct PopularResult: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String?
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    private var imagePath = "https://image.tmdb.org/t/p/w500"
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case lv = "lv"
    case zh = "zh"
}

extension PopularResult: PopularCellProtocol {
    var titleString: String {
        title
    }
    
    var subtitleString: String {
        releaseDate
    }
    
    var iconURL: String {
        imagePath + posterPath

    }
    
    
}


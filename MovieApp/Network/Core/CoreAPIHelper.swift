//
//  CoreAPIHelper.swift
//  URLSession
//
//  Created by Aslanli Faqan on 22.11.24.
//

import Foundation
enum HttpMethods: String {
    case GET
    case POST
    case PATCH
    case PUT
    case DELETE
}


enum BaseURL: String {
    case tmdb = "https://api.themoviedb.org/3/"
}

final class CoreAPIHelper {
    static let instance = CoreAPIHelper()
    private init() {}
    private let baseURL = BaseURL.tmdb.rawValue
    
    func makeURL(path: String) -> URL? {
        let urlString = baseURL + path
        return URL(string:urlString)
    }
    
    enum EndPoint: String {
        case popular = "movie/popular"
        case topRated = "movie/top_rated"
        case upcoming = "movie/upcoming"
    }
    
    func makeHeader() -> [String: String] {
        return ["Authoration": "Barear eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYTY2MzU0ODBkMDNjNDExMzA2MzUwZDViZDM0YTdkYiIsIm5iZiI6MTczNDYzNzkzNy4zMTcsInN1YiI6IjY3NjQ3OTcxMjljODgyOTdhMTFmNjc3MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Rl6HikoLc4mOcMFRmaGxqhvTyxLmLMZxPxFCae2hrNQ"]
    }
}

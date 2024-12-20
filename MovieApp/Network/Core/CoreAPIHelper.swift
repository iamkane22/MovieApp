//
//  CoreAPIHelper.swift
//  CountryAppKenan
//
//  Created by Kenan on 14.12.24.
//
import Foundation

public enum HttpMethods: String {
    case GET
    case POST
    case PATCH
    case PUT
    case DELETE
}

enum BaseURL: String {
    case json = "https://jsonplaceholder.typicode.com/"
    case country = "https://restcountries.com/v3.1/"
}

enum endPoint {
    case popular
    case topRated
    case upcoming
}

final class CoreAPIHelper {
    static let instance = CoreAPIHelper()
    private init() {}
    private let baseURL = BaseURL.country.rawValue
    
    func makeURL(path: String) -> URL? {
        let urlString = baseURL + path
        return URL(string:urlString)
    }
    
    func makeHeader() -> [String: String] {
        return ["Authoration": "Barear Token"]
    }
}


extension endPoint: endPointProtocol {
    func movieAPIUrlString() -> String {
        return "\(baseURL)\(genreURL)\(apiKey)"
    }
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    
    var genreURL: String {
        switch self {
        case .popular:
            "popular"
        case .topRated:
            "top_rated"
        case .upcoming:
            "upcoming"
        }
    }
    
    var apiKey: String {
        "?api_key=3a6635480d03c411306350d5bd34a7db"
    }
    
    var method: HttpMethods {
        switch self {
        case .popular:
                .GET
        case .topRated:
                .GET
        case .upcoming:
                .GET
        }
    }
    
    
}

//https://api.themoviedb.org/3/movie/popular?api_key=3a6635480d03c411306350d5bd34a7db

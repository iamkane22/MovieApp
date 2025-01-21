//
//  TopRatedHelper.swift
//  MovieApp
//
//  Created by Kenan on 18.01.25.
//
import Foundation

enum TopRatedHelper {
    case top_rated
    var mainPath: String {
        return "movie/"
    }
    var endpoint: URL? {
        return CoreAPIHelper.instance.makeURL(path: mainPath + "top_rated")
    }
}



//https://api.themoviedb.org/3/movie/top_rated


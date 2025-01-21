//
//  PopularHelper.swift
//  MovieApp
//
//  Created by Kenan on 13.01.25.
//
import Foundation

enum PopularHelper {
    case popular
    
    var mainpath: String {
        return "movie/"
    }
    
    var endpoint: URL? {
       return CoreAPIHelper.instance.makeURL(path: mainpath + "popular")
    }
    
}

//https://api.themoviedb.org/3/movie/popular


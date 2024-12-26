//
//  TrendingHelper.swift
//  MovieApp
//
//  Created by Kenan on 23.12.24.
//

import Foundation
enum TrendingHelper {
    case all
    
     var endPoint: URL? {
        switch self {
        case .all: return CoreAPIHelper.instance.makeURL(path: "all")
          
        }
    }
    
}

//
//  TrendingHelper.swift
//  MovieApp
//
//  Created by Kenan on 23.12.24.
//

import Foundation
enum TrendingHelper {
    case all(String)
    
    private var mainpath: String {
        return "trending/"
    }
    
     var endPoint: URL? {
        switch self {
        case .all(let query): return CoreAPIHelper.instance.makeURL(path: "\(mainpath)all/\(query)")
          
        }
    }
    
}

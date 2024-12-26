//
//  TrendingUseCase.swift
//  MovieApp
//
//  Created by Kenan on 23.12.24.
//

protocol TrendingUseCase {
    func getTrendingMovie(time: String, completion: @escaping (MovieDTO? ,String?) -> Void) 
        
    
}

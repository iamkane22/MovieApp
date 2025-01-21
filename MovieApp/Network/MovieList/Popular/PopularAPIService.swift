//
//  PopularAPIService.swift
//  MovieApp
//
//  Created by Kenan on 13.01.25.
//
import Foundation
final class PopularAPIService: PopularUseCase {
    
    private let apiService = CoreAPIManager.instance
    
    func getTrendingMovie(
        completion: @escaping (PopularDTO? , String?) -> Void
    ) {
        apiService.request(type: PopularDTO.self, url: PopularHelper.popular.endpoint, method: .GET) { [weak self] result in
            guard let _ = self else { return }
            switch result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
        
    }
    
    
}

//
//  TopRatedService.swift
//  MovieApp
//
//  Created by Kenan on 18.01.25.
//
import Foundation

final class TopRatedService: TopRatedUseCase {
    
    private let apiService = CoreAPIManager.instance

    func getTopRatedMovies(completion: @escaping (TopRatedDTO?, String?) -> Void) {
        apiService.request(type: TopRatedDTO.self, url: TopRatedHelper.top_rated.endpoint , method: .GET) { [weak self ] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                completion(data , nil)
            case .failure(let error):
                completion(nil , error.localizedDescription)
            }
        }
    }
    
    
}

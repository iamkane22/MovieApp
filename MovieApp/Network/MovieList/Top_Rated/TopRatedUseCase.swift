//
//  TopRatedUseCase.swift
//  MovieApp
//
//  Created by Kenan on 18.01.25.
//

protocol TopRatedUseCase {
    func getTopRatedMovies(completion: @escaping (TopRatedDTO?, String?) -> Void)
}

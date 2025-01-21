//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Kenan on 21.12.24.
//

enum ViewState {
    case loading
    case loaded
    case success
    case error(String)
}
//enum ViewStatePopular {
//    case loading
//    case loaded
//    case successPopular
//    case error(String)
//}

final class HomeViewModel {
    
    
    enum TimeInterval: String {
        case day
        case week
    }
    private var trendingUse: TrendingUseCase
    private var popularUse: PopularUseCase
    private var topRatedUse: TopRatedUseCase
    var type: TimeInterval = .day {
        didSet {
            getMovieList()
        }
    }
    private(set) var movieDTO: MovieDTO?
    private(set) var popularList: PopularDTO?
    private(set) var topRatedDTO: TopRatedDTO?
    var requestCallback: ((ViewState) -> Void)?
//    var popolarCallback: ((ViewStatePopular) -> Void)?
    init() {
        trendingUse = TrendingAPIService()
        popularUse = PopularAPIService()
        topRatedUse = TopRatedService()
    }
    
    func getTrandingCount() -> Int {
        movieDTO?.results.count ?? 0
    }
    
    func getPopularCount() -> Int {
        popularList?.results?.count ?? 0
    }
    
    func topRatedCount() -> Int {
        topRatedDTO?.results.count ?? 0
    }
    
    func getTrandingMovie(index: Int) -> MovieResult? {
        return movieDTO?.results[index]
    }
    
    func getTopRatedMovie(index: Int) -> TopRatedList? {
        return topRatedDTO?.results[index]
    }
    
    func getPopularMovie(index: Int) -> PopularResult? {
        return popularList?.results?[index]
    }
    
    private func getMovieList() {
        requestCallback?(.loading)
        trendingUse.getTrendingMovie(time: type.rawValue) { [weak self] dto, error in
            guard let self = self else { return }
            requestCallback?(.loaded)
            if let dto = dto {
                movieDTO = dto
                getPopularList()
            } else if let error = error {
                requestCallback?(.error(error))
            }
        }
    }
     func getPopularList() {
        requestCallback?(.loading)
        popularUse.getTrendingMovie { [weak self] dto, error in
            guard let self = self else { return }
            requestCallback?(.loaded)
            if let dto = dto {
                popularList = dto
                requestCallback?(.success)
            } else if let error = error {
                requestCallback?(.error(error))
            }
        }
    }
    func topRatedList() {
        requestCallback?(.loading)
        topRatedUse.getTopRatedMovies { [weak self] dto, error in
            guard let self = self else { return }
            requestCallback?(.loaded)
            if let dto = dto {
                topRatedDTO = dto
                requestCallback?(.success)
            } else if let error = error {
                requestCallback?(.error(error))
            }
        }
    }
}

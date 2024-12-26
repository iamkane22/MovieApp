//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Kenan on 21.12.24.
//
final class HomeViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
    }
    enum TimeInterval: String {
        case day
        case week
    }
    private var trendingUse: TrendingUseCase
    private var type: TimeInterval = .day
    private(set) var movieDTO: MovieDTO?
    var requestCallback: ((ViewState) -> Void)?
    init() {
        trendingUse = TrendingAPIService()
    }
    func getMovieList() {
        requestCallback?(.loading)
        trendingUse.getTrendingMovie(time: type.rawValue) { [weak self] dto, error in
            guard let self = self else { return }
            requestCallback?(.loaded)
            if let dto = dto {
                movieDTO = dto
                requestCallback?(.success)
            } else if let error = error {
                requestCallback?(.error(error))
            }
        }
    }
}

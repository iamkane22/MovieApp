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
        case successTrand
        case error(String)
    }
    enum TimeInterval: String {
        case day
        case week
    }
    private var trendingUse: TrendingUseCase
    var type: TimeInterval = .day {
        didSet {
            getMovieList()
        }
    }
    private(set) var movieDTO: MovieDTO?
    var requestCallback: ((ViewState) -> Void)?
    init() {
        trendingUse = TrendingAPIService()
    }
    
    func getTrandingCount() -> Int {
        movieDTO?.results.count ?? 0
    }
    
    func getTrandingMovie(index: Int) -> MovieResult? {
        return movieDTO?.results[index]
    }
    
    private func getMovieList() {
        requestCallback?(.loading)
        trendingUse.getTrendingMovie(time: type.rawValue) { [weak self] dto, error in
            guard let self = self else { return }
            requestCallback?(.loaded)
            if let dto = dto {
                movieDTO = dto
                requestCallback?(.successTrand)
            } else if let error = error {
                requestCallback?(.error(error))
            }
        }
    }
}

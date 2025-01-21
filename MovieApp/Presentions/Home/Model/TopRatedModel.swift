
import Foundation

// MARK: - TopRatedDTO
struct TopRatedDTO: Codable {
    let page: Int
    let results: [TopRatedList]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
private var imagePath = "https://image.tmdb.org/t/p/w500"
// MARK: - Result
struct TopRatedList: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
extension TopRatedList: TopRatedCellProtocol {
    var subTitleString: String {
        releaseDate
    }
    
    var iconUrl: String {
        imagePath + posterPath

    }
    
    var titleString: String {
        title
    }
}

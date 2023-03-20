//
//  MoviesViewModel.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 13.03.2023.
//

import Foundation

final class MoviesViewModel {
    var movies: [ResultArray] = []
    //movie
    let movieTypes: [WrapType] = [.movieArtist, .movie, .tvEpisode, .tvSeason]
    //    let softwareTypes: [WrapType] = [.software, .iPadSoftware, .macSoftware]
    //    //books
    //    let bookTypes: [WrapType] = [.audiobookAuthor, .audiobook, .ebook]
    
    var eventHandler: ((_ event: Event) -> Void)?
    // data binding
    func fetchMovies(searchword: String,type: String,pagination: Int) {
        APIManager.shared.request(
            modelType: TunesData.self,
            type: ProductEndPoint.products(search: searchword, type: type, page: pagination)) { response in
                self.eventHandler?(.stopLoading)
                switch response {
                case .success(let products):
                    self.movies = products.results
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
            }
    }
}
extension MoviesViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}

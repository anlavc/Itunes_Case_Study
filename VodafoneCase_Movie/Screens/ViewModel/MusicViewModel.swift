//
//  MusicViewModel.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 19.03.2023.
//

import UIKit

final class MusicViewModel {
    var music: [ResultArray] = []
    //music kategorisi öğeleri
    let musicTypes: [WrapType] = [.musicArtist, .musicTrack, .album, .musicVideo, .song, .mix]
    var eventHandler: ((_ event: Event) -> Void)?
    // data binding
    func fetchMusic(searchword: String,type: String,pagination: Int) {
        APIManager.shared.request(
            modelType: TunesData.self,
            type: ProductEndPoint.products(search: searchword, type: type, page: pagination)) { response in
                self.eventHandler?(.stopLoading)
                switch response {
                case .success(let products):
                    self.music = products.results
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
            }
    }
}
extension MusicViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}

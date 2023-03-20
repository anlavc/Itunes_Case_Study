//
//  Model.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 13.03.2023.
//

import Foundation

// MARK: - ITunes
struct TunesData: Codable {
    let resultCount: Int?
    let results: [ResultArray]!
}

// MARK: - Result
struct ResultArray: Codable {
    
    let collectionName: String!
    let artworkUrl100: String!
    let releaseDate: String?
    let country: String!
    let artistName: String?
    let longDescription: String?
    let primaryGenreName: String?
    let collectionArtistViewUrl: String?
    let previewUrl: String?
    let trackName: String?
    
}

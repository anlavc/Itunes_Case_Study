//
//  EndPointType.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 12.03.2023.
//

import Foundation
enum HTTPMethods: String {
    case get = "GET"
}

protocol EndPointType {
    var path: String {get}
    var baseURL: String {get}
    var url: URL? {get}
    var method: HTTPMethods {get}
    //    var body: Encodable? {get}
    //    var headers: [String: String]? {get}
}
enum WrapType: String {
    //movie
    case movieArtist = "Movie Artist"
    case movie = "Movie"
    case tvEpisode = "Tv Episode"
    case tvSeason = "Tv Season"
    //music
    case musicArtist = "Music Artist"
    case musicTrack = "Music Trac"
    case album = "Album"
    case musicVideo = "Music Video"
    case song = "Song"
    case mix = "Mix"
    //apps
    case software = "Software"
    case iPadSoftware = "Ipad Software"
    case macSoftware = "Mac Software"
    // books
    case audiobookAuthor = "Audio Book Author"
    case audiobook = "Audio Book"
    case ebook = "E-book"
    
}

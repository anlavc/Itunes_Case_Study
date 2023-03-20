//
//  MoviesEndPoint.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 12.03.2023.
//
// https://itunes.apple.com/search?term=cat&entity=movie&limit=20
import Foundation
enum ProductEndPoint {
    case products(search: String,type: String,page: Int)
}
extension ProductEndPoint: EndPointType {
    var path: String {
        switch self {
        case .products:
            return ""
        }
    }
    var baseURL: String {
        switch self {
        case .products(let searchword,let type,let page):
            return "https://itunes.apple.com/search?term=\(searchword)&entity=\(type)&limit=\(page)"
        }
    }
    var url: URL? {
        return URL(string: "\(baseURL)")
    }
    var method: HTTPMethods {
        switch self {
        case .products:
            return .get
            
        }
    }
    var body: Encodable? {
        switch self {
        case .products:
            return nil
        }
    }
}

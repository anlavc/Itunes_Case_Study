//
//  Optional + Extensions.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 17.03.2023.
//

import Foundation

extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        self == "" || self == nil || self == " "
    }
}

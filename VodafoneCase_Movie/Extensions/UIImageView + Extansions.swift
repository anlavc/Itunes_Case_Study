//
//  UIImageView + Extansions.swift
//  ShoppingAppPractice_MVVM
//
//  Created by Anıl AVCI on 9.03.2023.
//

import UIKit
import Kingfisher
// Kingfisher image cache Extensions
extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}

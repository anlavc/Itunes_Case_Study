//
//  ViewController + Extensions.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 17.03.2023.
//


import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title: String,message:String,buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = AlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC,animated: true)
        }
    }
}

//
//  MovieCell.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 14.03.2023.
//

import UIKit

class MovieCell: UICollectionViewCell {

   
    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        bgview.layer.cornerRadius = 8
        setCardView(view: bgview)
        imageView.layer.cornerRadius = 2
        
    }
    func setup(with movie: ResultArray) {
        imageView.setImage(with: movie.artworkUrl100 ?? "")
        collectionName.text = movie.trackName
        countryLabel.text = "- \(movie.country ?? "")"
        releaseDate.text = movie.releaseDate?.convertToMonthYearFormat() ?? ""
    }
    func setCardView(view : UIView){
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 0.5
    }
}

//
//  MusicCell.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 20.03.2023.
//

import UIKit

class MusicCell: UICollectionViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bgview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        super.awakeFromNib()
        bgview.layer.cornerRadius = 8
        setCardView(view: bgview)
        imageView.layer.cornerRadius = 2
    }
    func setup(with music: ResultArray) {
        imageView.setImage(with: music.artworkUrl100 ?? "")
        titleLabel.text = music.artistName
        subtitleLabel.text = music.trackName ?? ""
    }
    func setCardView(view : UIView){
        view.layer.masksToBounds = false
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 0.5
    }
}

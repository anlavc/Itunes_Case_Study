//
//  MovieDetailViewController.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 18.03.2023.
//

import UIKit
import SafariServices

class MovieDetailViewController: UIViewController {

    var selectedMovie: ResultArray?
    @IBOutlet weak var playbutton: UIButton!
    @IBOutlet weak var blurview: UIVisualEffectView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var artistNameButton: UIButton!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       setUp()
        navigationController?.navigationBar.prefersLargeTitles = false
      //  artistNameButton.titleLabel?.minimumScaleFactor = 0.5
        blurview.layer.opacity = 0.9
    }
    

    @IBAction func artistNameButtonTapped(_ sender: UIButton) {
        let link = selectedMovie?.collectionArtistViewUrl
        if  let url = URL(string: link ?? "") {
              let safarivc = SFSafariViewController(url: url)
            present(safarivc, animated: true)
        }
    }
 
    @IBAction func playButtonTapped(_ sender: Any) {
        let link = selectedMovie?.previewUrl
        if  let url = URL(string: link ?? "") {
              let safarivc = SFSafariViewController(url: url)
            present(safarivc, animated: true)
        }
        
    }
    private func setUp() {
        self.navigationItem.title = selectedMovie?.collectionName
        trackNameLabel.text = selectedMovie?.trackName
        kindLabel.text = selectedMovie?.primaryGenreName ?? ""
        countryLabel.text = selectedMovie?.country
        if let artistName = selectedMovie?.artistName {
            artistNameButton.setTitle("\(artistName)", for: .normal)}
        longDescriptionLabel.text = selectedMovie?.longDescription ?? ""
        avatarImage.setImage(with: selectedMovie?.artworkUrl100 ?? "")
        bannerImage.setImage(with: selectedMovie?.artworkUrl100 ?? "")
    }

}

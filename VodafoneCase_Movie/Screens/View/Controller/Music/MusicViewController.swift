//
//  MusicViewController.swift
//  VodafoneCase_Movie
//
//  Created by Anıl AVCI on 19.03.2023.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet weak var searchView: UITextField!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    var searchMusicWord = "tarkan"
    var searchMusicType = "musicVideo"
    var page = 20
    var hasMoreMovie = true
    private var viewModel = MusicViewModel()
    let pickerView = UIPickerView(frame:CGRect(x: 0, y: 50, width: 260, height: 162))
    let tableViewFilter = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    var selectedRow: Int?
    private var collectionCell = "MusicCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        initViewModel()
        observeEvent()
        searchView.delegate = self
        searchView.returnKeyType = .go
        searchTextView()
        pickerView.delegate = self
        addKeyboardDismissRecognizer()
        
    }
    func addKeyboardDismissRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapRecognizer.cancelsTouchesInView = false
        collectionView.addGestureRecognizer(tapRecognizer)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func searchTextView() {
        searchView.layer.shadowColor = UIColor.systemIndigo.cgColor
        searchView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        searchView.layer.masksToBounds = false
        searchView.layer.shadowRadius = 1.0
        searchView.layer.shadowOpacity = 0.5
        searchView.layer.cornerRadius = 10
    }
    @objc func pickerButtonTapped() {
        let alertController = UIAlertController(
            title: "",
            message: "\n\n\n\n\n\n",
            preferredStyle: .actionSheet)
        alertController.view.tintColor = .systemIndigo
        alertController.view.addSubview(pickerView)
        let margin: CGFloat = 8.0
        let rect = CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: 145)
        pickerView.frame = rect
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let selectAction = UIAlertAction(title: "Select", style: .default, handler: { (action) in
            if self.searchView.text.isNilOrEmpty {
                return
            }
            let selectedRow = self.pickerView.selectedRow(inComponent: 0)
            if selectedRow < self.viewModel.musicTypes.count {
                DispatchQueue.main.async {
                    
                    if let searchMusicWord = self.searchView.text?.replacingOccurrences(of: " ", with: "+"), !searchMusicWord.isEmpty {
                        self.viewModel.fetchMusic(searchword: searchMusicWord, type: "\(self.viewModel.musicTypes[selectedRow])", pagination: self.page)
                        self.searchMusicType = "\(self.viewModel.musicTypes[selectedRow])"
                        self.navigationItem.title = self.viewModel.musicTypes[selectedRow].rawValue
                        self.collectionView.reloadData()
                    }
                }
                self.addKeyboardDismissRecognizer()
                print("Selected item: \(self.viewModel.musicTypes[selectedRow])")
            }
        })
        alertController.addAction(cancelAction)
        alertController.addAction(selectAction)
        present(alertController, animated: true, completion: nil)
    }
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        pickerButtonTapped()
    }
    func initViewModel() {
        viewModel.fetchMusic(searchword: searchMusicWord, type: searchMusicType, pagination: page)
    }
    func configureCollectionView() {
        let nibCell = UINib(nibName: collectionCell, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: collectionCell)
    }
    
    // Data binding event observe
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else {return}
            
            switch event {
            case .loading:
                //indicator show
                print("Product loading...")
            case .stopLoading:
                // indicator hide
                print("Stop loading...")
            case .dataLoaded:
                if self.viewModel.music.count == 0 {
                    self.presentGFAlertOnMainThread(title: "Opss!", message: "No Results Found", buttonTitle: "Ok")
                } else {
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                print("Data loaded count...\( self.viewModel.music.count)")
            case .error(_):
                self.presentGFAlertOnMainThread(title: "Warning", message: "A problem has been encountered. Please try again.", buttonTitle: "Ok")
            }
        }
        
    }
}
extension MusicViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.music.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath) as! MusicCell
        cell.setup(with: viewModel.music[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "movieDetail") as? MovieDetailViewController
        let selectedMovie = viewModel.music[indexPath.item]
        vc?.selectedMovie = selectedMovie
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 176, height: 88)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        if offsetY > contentHeight - height {
            guard hasMoreMovie else {return}
            page += 10
            viewModel.fetchMusic(searchword: searchMusicWord, type: searchMusicType, pagination: page)
        }
    }
}
extension MusicViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // PickerView Delegate ve DataSource metodları
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.musicTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.musicTypes[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedRow = row
    }
    
    
}

extension MusicViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if searchView.text.isNilOrEmpty {
            presentGFAlertOnMainThread(title: "Warning", message: "Please enter a word to search.", buttonTitle: "Ok")
        } else {
            page = 20
            if let searchMovieWord = searchView.text?.replacingOccurrences(of: " ", with: "+"), !searchMovieWord.isEmpty {
                DispatchQueue.main.async {
                    self.searchMusicWord = searchMovieWord
                    self.viewModel.fetchMusic(searchword: searchMovieWord, type: self.searchMusicType, pagination: self.page )
                    self.collectionView.reloadData()
                    self.view.endEditing(true)
                }
            }
        }
        return true
    }
}

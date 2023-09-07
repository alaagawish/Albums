//
//  AlbumViewController.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import UIKit
import RxCocoa
import RxSwift

class AlbumViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var imagesCollection: UICollectionView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    var currentPhotos: [Photo] = []
    var allPhotos: [Photo] = []
    var albumViewModel: AlbumViewModel!
    var album: Album!
    var disposeBag: DisposeBag!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        albumViewModel.getPhotos(albumId: album.id ?? 1)
        setData()
        search()
        
    }
    
    func initViews() {
        disposeBag = DisposeBag()
        searchBar.delegate = self
        albumViewModel = AlbumViewModel(network: Network())
        albumViewModel.passPhotosToViewController = {
            [weak self] in
            self?.allPhotos = self?.albumViewModel.photos ?? []
            self?.currentPhotos = self?.albumViewModel.photos ?? []
            self?.imagesCollection.reloadData()
            self?.search()
        }
        
    }
    
    func setData() {
        albumTitle.text = album.title
    }
    
    func search() {
        searchBar.rx.text.subscribe {[weak self] text in
            guard let self = self else {return}
            self.filterList(searchText: text!)
        }.disposed(by: disposeBag)
    }
    
    func filterList(searchText: String) {
        if(!searchText.isEmpty) {
            currentPhotos = allPhotos.filter{ $0.title.lowercased().contains(searchText.lowercased())}
            if currentPhotos.isEmpty {
                currentPhotos = []
            }
        }else {
            currentPhotos = allPhotos
        }
        self.imagesCollection.reloadData()
    }
    
    
    
}

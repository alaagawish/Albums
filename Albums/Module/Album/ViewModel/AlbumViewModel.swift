//
//  AlbumViewModel.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import Foundation

class AlbumViewModel {
    
    var network: NetworkProtocol!
    var passPhotosToViewController: (()->()) = {}
    var photos: [Photo] = [] {
        didSet{
            passPhotosToViewController()
        }
    }
    
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    
    func getPhotos(albumId: Int) {
        network.getPhotos(albumId: albumId ) {
            [weak self] response in
            
            self?.photos = response ?? []
        }
    }
    
    
}

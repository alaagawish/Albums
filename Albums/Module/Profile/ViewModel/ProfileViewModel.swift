//
//  ProfileViewModel.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import Foundation

class ProfileViewModel {
    
    var network: NetworkProtocol!
    var passAlbumsToViewController: (()->()) = {}
    var passUserToViewController: (()->()) = {}
    var albums: [Album] = [] {
        didSet{
            passAlbumsToViewController()
        }
    }
    
    var user: User? {
        didSet{
            passUserToViewController()
            getAlbums()
        }
    }
    
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    
    func getAlbums() {
        network.getAlbums(userId: user?.id ?? 0) {
            [weak self] response in
            
            self?.albums = response ?? []
        }
    }
    
    func getUsers() {
        network.getUsers {
            [weak self] users in
            self?.user = users?[Int.random(in: 0..<(users?.count ?? 0))] ?? nil
        }
    }
}

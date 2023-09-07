//
//  ProfileViewController.swift
//  Albums
//
//  Created by Alaa on 06/09/2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userAddress: UILabel!
    
    @IBOutlet weak var albumsTable: UITableView!
    var profileViewModel: ProfileViewModel!
    var allAlbums: [Album] = []
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initViews()
        profileViewModel.getUsers()
        
        
    }
    
    func initViews() {
        profileViewModel = ProfileViewModel(network: Network())
        profileViewModel.passAlbumsToViewController = {
            [weak self] in
            self?.allAlbums = self?.profileViewModel.albums ?? []
            self?.albumsTable.reloadData()
        }
        profileViewModel.passUserToViewController = {
            [weak self] in
            self?.user = self?.profileViewModel.user
            self?.setData()
        }
    }
    
    func setData() {
        userName.text = user.name
        userAddress.text = user.address.street + ", " + user.address.suite + ", " + user.address.city + ", " + user.address.zipcode
    }
}


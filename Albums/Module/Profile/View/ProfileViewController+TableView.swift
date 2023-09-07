//
//  ProfileViewController+TableView.swift
//  Albums
//
//  Created by Alaa on 07/09/2023.
//

import UIKit

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allAlbums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.albumCell, for: indexPath)
        cell.textLabel?.text = allAlbums[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
          let albumDetails = self.storyboard?.instantiateViewController(withIdentifier: Constants.albumStoryboard) as! AlbumViewController
          
          
              navigationController?.pushViewController(albumDetails, animated: true)
              
          
      }
    
    
}

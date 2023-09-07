//
//  AlbumCollectionViewCell.swift
//  Albums
//
//  Created by Alaa on 07/09/2023.
//

import UIKit
import Kingfisher

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = false
    }
    func setImage(photo: Photo) {
        
        photoImageView.kf.setImage(with: URL(string: photo.thumbnailUrl))
    }
}

//
//  ImageViewerViewController.swift
//  Albums
//
//  Created by Alaa on 07/09/2023.
//

import UIKit
import Kingfisher


class ImageViewerViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var selectedImage: UIImageView!
    var selectedPhoto: Photo!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        selectedImage.kf.setImage(with: URL(string: selectedPhoto.url))
        
    }
    
    func initViews() {
        scroller.minimumZoomScale = 1.0
        scroller.maximumZoomScale = 3.0
        //   scroller.setZoomScale(2.0, animated: true)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return selectedImage
    }
    
    
    
    @IBAction func share(_ sender: Any) {
        
        guard let image = selectedImage.image else { return }
        
        let viewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(viewController, animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

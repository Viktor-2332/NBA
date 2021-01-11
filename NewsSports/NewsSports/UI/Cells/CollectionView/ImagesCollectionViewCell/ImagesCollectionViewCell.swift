//
//  ImagesCollectionViewCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 04.01.2021.
//  Copyright © 2021 Виктор Ильюкевич. All rights reserved.
//

import UIKit


class ImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var cellImageView: UIImageView!
    
    @IBOutlet weak var imageindecaor: UIActivityIndicatorView!
    private let imageService : ImageServiceProtocol = ImageService()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageindecaor.hidesWhenStopped = true
    }

    
    func configure(imageURLString: String) {
        imageindecaor.startAnimating()
        imageService.loadImageFromURL(imageURLString: imageURLString) { result in
            switch result {
            case .success(let data):
                self.cellImageView.image = UIImage(data: data)
            case .failure:
                self.cellImageView.image = UIImage(named: "1")
            }
            self.imageindecaor.stopAnimating()
        }
    }
}

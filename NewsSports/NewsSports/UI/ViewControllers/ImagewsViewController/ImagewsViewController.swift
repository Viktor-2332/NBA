//
//  ImagewsViewController.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 04.01.2021.
//  Copyright © 2021 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class ImagewsViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel: ImageViewModelProtocol = ImagesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: "ImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImagesCollectionViewCell")
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 300, height: 300)
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.dataSource = self
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.images.count
    }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let image = viewModel.images[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImagesCollectionViewCell", for : indexPath) as? ImagesCollectionViewCell {
            cell.configure(imageURLString: image)
            return cell
        }
        return UICollectionViewCell()
       }
   
}

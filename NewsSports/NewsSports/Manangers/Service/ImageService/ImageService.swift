//
//  imageService.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 11.01.2021.
//  Copyright © 2021 Виктор Ильюкевич. All rights reserved.
//

import Foundation
protocol ImageServiceProtocol {
     func loadImageFromURL(imageURLString:String, completion: @escaping (Result<Data,Error>) -> ())
}
class ImageService: ImageServiceProtocol {
    func loadImageFromURL(imageURLString: String, completion: @escaping (Result<Data,Error>) -> ()) {
        guard let url = URL(string: imageURLString) else { return }
        URLSession.shared.dataTask(with: url) { (data, responce, error) in
//            DispatchQueue.global().async {
//                if let data = try? Data(contentsOf: url)  {
                    DispatchQueue.main.async {
                        if let error = error {
                            completion(.failure(error))
                            return
                        }
//                    }
                      guard let data = data else {return}

                        completion(.success(data))
                    }
            }.resume()
        }
}



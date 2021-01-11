//
//  SetImageViewController.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 29.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class SetImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
     var activityIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func loadSavedImageAction(_ sender: Any) {
         // получаю ссылку файловой системы documentDirectory
        guard let directoryURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return
        }
        // пытаемся достать ПУТЬ файла image.jpg который ведет к documentDirectory
        if let url = directoryURL.appendingPathComponent("image.jpg"), let data = try? Data(contentsOf: url) {
            self.imageView.image = UIImage(data: data)
            activityIndicator.startAnimating()
        }
        
       
    }
    //    loadSavedImage
    @IBAction func loadImageAction(_ sender: Any) {
        if let url = URL(string: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1601&q=80") {
            if let data = try? Data(contentsOf: url) {
                self.imageView.image = UIImage(data: data)
            }
        }
     }
    
    @IBAction func saveImageAction(_ sender: Any) {
        guard let directoryURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return
        }
        print("[TEST] image PAth \(directoryURL.absoluteString)")
        
        if let image = imageView.image {
            let data = image.jpegData(compressionQuality: 1)
            print("Success")
            
            do {
                try data?.write(to: directoryURL.appendingPathComponent("image.jpg")!)
            } catch {
                print(error.localizedDescription)
            }
           
        }
    }
}

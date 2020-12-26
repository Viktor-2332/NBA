//
//  UIAlertViewController.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 05.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func show(title: String?, message: String?, view: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        view.present(alert, animated: true, completion: nil)
    }
}

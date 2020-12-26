//
//  WeatherTableViewCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 15.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet private weak var contentStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
//        contentStackView.arrangedSubviews.forEach({$0.removeFromSuperview()})
        contentStackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
//        for view in  contentStackView.arrangedSubviews {
//            view.removeFromSuperview()
//        }
    }
    
    func configure(weathers: [Weather]) {
        for item in weathers {
            let infoView = WeatherInfoView()
            infoView.configure(weather: item)
            contentStackView.addArrangedSubview(infoView)
        }
//        weathers.forEach { weather in
//
//        }
        
    }
}


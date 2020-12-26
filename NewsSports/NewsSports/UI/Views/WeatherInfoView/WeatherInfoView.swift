//
//  WeatherInfoView.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 16.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class WeatherInfoView: UIView {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    
    @IBOutlet var mainView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configure(weather: Weather) {
        idLabel.text = "Weather Id = " + "\(weather.id ?? 0)"
        mainLabel.text = "Weather main Info: " + (weather.main ?? "")
        descriptionLabel.text = "Weather description" + (weather.description ?? "")
        iconLabel.text = "Weather icon" + (weather.icon ?? "")
    }
    
    private func setupView() {
        Bundle.main.loadNibNamed("WeatherInfoView", owner: self, options: nil)
        addSubview(mainView)
        mainView.frame = self.frame
        mainView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

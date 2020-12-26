//
//  CountryWeatherTableViewCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 15.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class CountryWeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(country: CountryData) {
        countryLabel.text = "Country code " + "\(country.country)"
        sunriseLabel.text = "Sunrise time " + "\(country.sunrise ?? 0)"
        sunsetLabel.text = "Sunset time " + "\(country.sunset ?? 0)"
    }
}


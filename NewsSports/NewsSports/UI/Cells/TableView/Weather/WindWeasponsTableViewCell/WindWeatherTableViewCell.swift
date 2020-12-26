//
//  WindWeatherTableViewCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 15.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class WindWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var degLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(wind: Wind) {
        speedLabel.text =  "Скорость ветра" + "\(wind.speed ?? 0)"
        degLabel.text = "Направление ветра" + "\(wind.deg ?? 0)"
    }
}


//
//  MainWeatherTableViewCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 15.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class MainWeatherTableViewCell: UITableViewCell {
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var seaLevelLabel: UILabel!
    @IBOutlet weak var grndLevelLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(main: MainWeatherParameters) {
        tempLabel.text = "Температура" + "\(main.temp ?? 0)"
        feelsLikeLabel.text = "Температура. Этот температурный параметр объясняет человеческое восприятие погоды" + "\(main.feelsLike ?? 0)"
        tempMinLabel.text = "Минимальная температура" + "\(main.tempMin ?? 0)"
        tempMaxLabel.text = "Максимальная температура" + "\(main.tempMax ?? 0)"
        pressureLabel.text = "Атмосферное давление " + "\(main.pressure ?? 0)"
        humidityLabel.text = "Влажность,%" + "\(main.humidity ?? 0)"
        seaLevelLabel.text = "Атмосферное давление наd уровне моря, гПа" + "\(main.seaLevel ?? 0)"
        grndLevelLabel.text = "Атмосферное давление на уровне земли, гПа" + "\(main.grndLevel ?? 0)"
    }
}

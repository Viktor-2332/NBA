//
//  CoordWeatherTableviewCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 16.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class CoordWeatherTableviewCell: UITableViewCell {
    @IBOutlet weak var lonLabel: UILabel!
    @IBOutlet weak var lanLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(coordinate: Coordinate) {
        lonLabel.text = "longitude Geographical coordinates" + "\(coordinate.lat ?? 0)"
        lanLabel.text = "latitude Geographical coordinates" + "\(coordinate.lat ?? 0)"
    }
}


//

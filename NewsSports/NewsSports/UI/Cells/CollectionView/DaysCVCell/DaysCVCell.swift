//
//  DaysCVCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 30.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class DaysCVCell: UICollectionViewCell {
    @IBOutlet weak var DayofWeakLabel: UILabel!
     
    @IBOutlet weak var NumberDayLabel: UILabel!
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    func configure(day: DayObject, isSelected: Bool ) {
        DayofWeakLabel.text = day.dayName
        NumberDayLabel.text = "\(day.dayNumber ?? 0)"
        if isSelected == true {
            DayofWeakLabel.textColor = .green
            NumberDayLabel.textColor = .green
        } else {
            DayofWeakLabel.textColor = .black
            NumberDayLabel.textColor = .black
        }
        }
    }


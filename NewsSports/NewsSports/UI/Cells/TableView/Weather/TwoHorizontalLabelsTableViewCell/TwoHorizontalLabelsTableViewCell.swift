//
//  TwoHorizontalLabelsTableViewCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 15.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class TwoHorizontalLabelsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(title: String?, subtitle: String?) {
        titleLabel.text = title ?? ""
        subtitleLabel.text = subtitle ?? ""
    }
}


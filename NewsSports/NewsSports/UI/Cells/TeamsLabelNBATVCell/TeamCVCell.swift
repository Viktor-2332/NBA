//
//  TeamCVCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 11.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class TeamCVCell: UICollectionViewCell {
    @IBOutlet private weak var teamIcon: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareAppearance()
    }
    
    func configure(team: Team) {
        teamIcon.image = UIImage(named: team.abbreviation ?? "")
        teamNameLabel.text = team.fullName
        
    }
//    private func setupView() {
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(homeTeamTapped))
//    homeOutlet.addGestureRecognizer(tapGesture)
    
    //MARK: - Private
    private func prepareAppearance() {
        self.teamIcon.layer.cornerRadius = self.teamIcon.frame.size.height / 2
    }
}

//
//  TeamCVCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 11.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit
 
struct VeticalImageWithTextCellViewModel {
    var image: String?
    var title: String?
    
    init(image: String?, title: String?) {
        self.image = image
        self.title = title
    }

}
class VeticalImageWithTextCell: UICollectionViewCell {
    @IBOutlet private weak var teamIcon: UIImageView!
    @IBOutlet private weak var teamNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareAppearance()
    }
    
    func configure(teamModel: VeticalImageWithTextCellViewModel) {
        teamIcon.image = UIImage(named: teamModel.image ?? "")
        teamNameLabel.text = teamModel.title
        
    }
//    private func setupView() {
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(homeTeamTapped))
//    homeOutlet.addGestureRecognizer(tapGesture)
    
    //MARK: - Private
    private func prepareAppearance() {
        self.teamIcon.layer.cornerRadius = self.teamIcon.frame.size.height / 2
    }
}

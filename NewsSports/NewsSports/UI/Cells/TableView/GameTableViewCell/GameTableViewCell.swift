//
//  GameTableViewCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 25.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

protocol GameTableViewCellDelegate: AnyObject {
    func gameTapped(id: Int?)
}

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var periodBackground: UIView!
    
    @IBOutlet weak var customBackgroundView: UIView!
    @IBOutlet weak var contentBackground: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var visitorTeamScoreLabel: UILabel!
//    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var visitorLAbel: UILabel!
    @IBOutlet weak var homeOutlet: UIStackView!
    
    @IBOutlet weak var visitorOutlet: UIStackView!
    @IBOutlet weak var homeImage: UIImageView!
    
    @IBOutlet weak var visitorImage: UIImageView!
    weak var delegate: GameTableViewCellDelegate?
    var game: Game?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setupView()
        prepareAppearance()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
   
    //MARK: - Actions
    
    @objc private func homeTeamTapped() {
        print("homeTeamTapped")
        delegate?.gameTapped(id: game?.homeTeam?.id)
    }
    
    @objc private func visitorTeamTapped() {
        print("visitorTeamTapped")
        delegate?.gameTapped(id: game?.visitorTeam?.id)
    }
    
    func configure(game: Game) {
        self.game = game
        
        homeLabel.text = game.homeTeam?.abbreviation
        visitorLAbel.text = game.visitorTeam?.abbreviation
        let time = game.time?.replacingOccurrences(of: " ", with: "") ?? "" // убираем все пробелы в строке
        timeLabel.text = time
        timeLabel.isHidden = time.isEmpty
        periodLabel.text = "Period: \(game.period ?? 0)"
        homeTeamScoreLabel.text = "\(game.homeTeamScore ?? 0)"
        visitorTeamScoreLabel.text = "\(game.visitorTeamScore ?? 0)"
        dateLabel.text = (game.date ?? "").UTCToLocalString(outGoingFormat: Constants.shortDateFormat)
        statusLabel.text = (game.status ?? "") + " \(game.season ?? 0)"
        if game.postseason == false {
            print("Сезон окончен ")
            seasonLabel.text = "Сезон окончен "
        } else {
            print("Сезон еще идет")
            seasonLabel.text = "Сезон еще идет"
        }
        homeImage.image = UIImage(named: game.homeTeam?.abbreviation ?? "")
        visitorImage.image = UIImage(named: game.visitorTeam?.abbreviation ?? "")

    //     .dateFormat = "yyyy-mm-dd"
     }
    
    private func setupView() {
        customBackgroundView.layer.cornerRadius = 12
        selectionStyle = .none
        //        contentView.layer.cornerRadius = 12
        
        //        periodBackground.layer.cornerRadius = 12
        //        contentBackground.layer.cornerRadius = 12
        backgroundColor = .clear
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(homeTeamTapped))
        homeOutlet.addGestureRecognizer(tapGesture)
        
        let visitorTapGesture = UITapGestureRecognizer(target: self, action: #selector(visitorTeamTapped))
        visitorOutlet.addGestureRecognizer(visitorTapGesture)
    }
    //MARK: - Private
            private func prepareAppearance() {
                self.homeImage.layer.cornerRadius = self.homeImage.frame.size.height / 2
               self.visitorImage.layer.cornerRadius = self.visitorImage.frame.size.height / 2
         }
}

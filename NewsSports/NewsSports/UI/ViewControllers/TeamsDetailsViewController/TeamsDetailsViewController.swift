//
//  TeamsDetailsViewController.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 03.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class TeamsDetailsViewController: UIViewController {
    @IBOutlet weak var NameComandLabel: UILabel!
    @IBOutlet weak var StaticsGameLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
        
    @IBOutlet weak var teamSegmentControll: UISegmentedControl!
    @IBOutlet weak var LogotipComandImage: UIImageView!
    
    private var viewModel: TeamsDetailsViewModelProtocol?
    var teamId: Int?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        prepareAppearance()
        prepareFavoriteButton()
        
        viewModel = TeamsDetailsViewModel(teamID: teamId, fetcher: SportFetcher(networkService: NetworkSevice()))
        viewModel?.fetchTeamDetails(completion: { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                UIAlertController.show(title: "Error", message: error.localizedDescription, view: self)
            } else {
//                self.viewModel?.team?.abbreviation ?? ""
                self.LogotipComandImage.image = UIImage(named: self.viewModel?.team?.abbreviation ?? "")
                self.NameComandLabel.text = " \(self.viewModel?.team?.fullName ?? "")"
                self.textView.text = Constants.teamsinfo[self.viewModel?.team?.abbreviation ?? ""]
//                self.textView.text = Constants.playersinfo[self.viewModel?.team?.abbreviation ?? ""]
    //
                
                
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true) // принудительно прячем верхний бар
        
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true) // принудительно показываем верхний бар при уходе с экрана
    }
    
    //MARK: - Actions
    @IBAction private func BackAction(_ sender: Any) {
       navigationController?.popViewController(animated: true)
//      performSegue(withIdentifier: "TeamsDetailsViewController", sender: self)
//        dismiss(animated: true, completion: nil) // этот код не работает, так как этот код прячет только контроллер, открытый модально ( снизу вверх, такой показ обычно без навигации) загугли, что я в ВК присылал
        
    }
    
    @IBAction private func teamSegmentController(_ sender: Any) {
        switch teamSegmentControll.selectedSegmentIndex
            {
            case 0:
               self.NameComandLabel.text = " \(self.viewModel?.team?.fullName ?? "")"
            case 1:
                self.textView.text = Constants.playersinfo[self.viewModel?.team?.abbreviation ?? ""]
        default:
            break
        }
        }
        

    @IBAction func FavoriteButton(_ sender: UIButton) {
        //выставь ей свойство isSelected на противоположное от текущего ( isSelected - это булевское свойство у кнопки (
        // у кнопки свойство tintColor отвечает за изменение цвета текста и цвета картинки, при условии, что сама кнопка имеет стиль SYSTEM

        favoriteButton.isSelected = !favoriteButton.isSelected


        // что--то пропустил
        // а если еще раз нажать на нее ? у тебя всегда станет желтой на и уже не станет белой if
        //а тут при нажатии на кнопку тебе надо поменять ее свойство, чтобы она стала isSelected
        //так как для этого состояния смы указали, что она будет желтой
    }
    //MARK: - Private
    private func prepareAppearance() {
        self.LogotipComandImage.layer.cornerRadius = self.LogotipComandImage.frame.size.height / 2
        NameComandLabel.font = .systemFont(ofSize: 17)

        NameComandLabel.textAlignment = .center
        NameComandLabel.textColor = .red
        //засетать лэйбликам нужный шрифт с размером, цвет текста
        // засетать кнопке favorite текст, цвет текста, границу и ширину границы (загугли swift button border)

    }
   
    private func prepareFavoriteButton() {
        favoriteButton.setTitle("Favorite", for: .normal)
        favoriteButton.tintColor =  .white

        favoriteButton.setTitleColor(UIColor.white, for: .normal)
        favoriteButton.setTitleColor(UIColor.yellow, for: .selected)
        favoriteButton.setImage(UIImage(named: "star-filled"), for: .normal)
        favoriteButton.setImage(UIImage(named: "star-empty"), for: .selected)
        favoriteButton.imageView?.image =  favoriteButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
        favoriteButton.backgroundColor = UIColor.clear
        favoriteButton.layer.cornerRadius = 5
        favoriteButton.layer.borderWidth = 1
        favoriteButton.layer.borderColor = UIColor(red: 74/255, green: 218/255, blue: 163/225, alpha: 1).cgColor
        //тут у тебя настройки кнопки -- их надо вынести в метод, где все UI настройки делаются
    }
   
    
    
    
}



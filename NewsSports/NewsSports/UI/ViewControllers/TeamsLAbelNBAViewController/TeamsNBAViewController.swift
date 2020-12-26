//
//  TeamsNBAViewController.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 11.12.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class TeamsNBAViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, RegisterInfoViewDelegate {
   
   
    @IBOutlet weak var registerInfoView: RegisterInfoView!
    @IBOutlet weak var collectionView: UICollectionView!

    let viewModel: TeamsNBAViewModelProtocol = TeamsNBAViewModel(fetcher: SportFetcher(networkService: NetworkSevice()))
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerInfoView.delegate = self
        viewModel.fetchTeams { [weak self] error in
            if let error = error {
                guard let self = self else {
                    return
                }
                print("no data \(error.localizedDescription)")
                UIAlertController.show(title: "Error", message: error.localizedDescription, view: self)
            } else {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupCollectionView()
        if UserDefaults.standard.bool(forKey: Constants.isUserLoginInKey) {
            registerInfoView.isHidden = true
        } else  {
            registerInfoView.isHidden = false
        }
    }
    

    
    //MARK: - UICollectionViewDataSource, UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let team = viewModel.teams[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCVCell", for: indexPath) as? TeamCVCell {
            cell.configure(team: team)
            return cell
        }
         return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let team = viewModel.teams[indexPath.row]
        performSegue(withIdentifier: "TeamsDetailsViewController", sender: team.id)
    }
    
    
    //MARK: RegisterInfoViewDelegate
    
    func registerButtonTapped() {
           performSegue(withIdentifier: "RegisterViewController", sender: nil)
       }
       
       func signInButtonTapped() {
           performSegue(withIdentifier: "", sender: nil)
       }
       
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//           if let game = viewModel.teams[indexPath.row],
//               let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as? GameTableViewCell {
//               cell.configure(game: game)
//               cell.delegate = self
//               return cell
//           }
//           return UITableViewCell()
//       }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.zero
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let yourWidth = collectionView.bounds.width/3.0
//        let yourHeight = yourWidth
//
//        return CGSize(width: yourWidth, height: yourHeight)
//    }
    
    //MARK: -Private
    private func  setupCollectionView() {
        view.layoutIfNeeded()
        
        collectionView.register(UINib(nibName: "TeamCVCell", bundle: nil), forCellWithReuseIdentifier: "TeamCVCell")
        collectionView.dataSource = self
        collectionView.delegate = self

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = .zero
        flowLayout.itemSize = CGSize(width: (collectionView.frame.size.width - flowLayout.minimumLineSpacing)  / 3, height: (collectionView.frame.size.width - flowLayout.minimumLineSpacing)  / 3)
        flowLayout.scrollDirection = .vertical
        collectionView.collectionViewLayout = flowLayout
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "TeamsDetailsViewController" {
//            if let destination = segue.destination as? TeamsDetailsViewController {
//                if let teamId = sender as? Int {
//                    destination.teamId = teamId
//                }
//            }
//        }
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TeamsDetailsViewController" {
            if let destination = segue.destination as? TeamsDetailsViewController {
                if let teamId = sender as? Int {
                    destination.teamId = teamId
                }
            }
        }
      
    }
}

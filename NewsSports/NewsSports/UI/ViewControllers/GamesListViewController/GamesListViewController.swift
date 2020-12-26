//
//  GamesListViewController.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 22.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class GamesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
   
   
    @IBOutlet weak var datamonthLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel: GamesListViewModelProtocol = GamesListViewModel(nbafetch: SportFetcher(networkService: NetworkSevice()))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupCollectionView()
        datamonthLabel.text = viewModel.monthTitle
        if let day = viewModel.days.first {
            viewModel.fetchSportsGame(selectedDay: day) { [weak self] error in
                if let error = error {
                    guard let self = self else { return }
                    print("no data \(error.localizedDescription)")
                    UIAlertController.show(title: "Error", message: error.localizedDescription, view: self)
                } else {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    @IBAction func refreshAction(_ sender: Any) {
        print("REfreshing...")
        if let selected = viewModel.selectedDay {
            viewModel.fetchSportsGame(selectedDay: selected) { [weak self] error in
                guard let self = self else { return }
                if let error = error {
                    UIAlertController.show(title: "Error", message: error.localizedDescription, view: self)
                } else {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    //MARK: - Private
    
  
    private func setupTableView() {
        tableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "GameTableViewCell")
        tableView.dataSource = self
        tableView.separatorStyle = .none

    }
    
    private func setupCollectionView() {
        // реагешь ячейку
        // сетаешь датасорс
        // 4--мя строчками описываешь FlowLayout
        collectionView.register(UINib(nibName: "DaysCVCell", bundle: nil), forCellWithReuseIdentifier: "DaysCVCell")
    
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 50, height: 45)
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
        collectionView.dataSource = self
        collectionView.delegate = self

    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let day = viewModel.days[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysCVCell", for: indexPath) as? DaysCVCell {
            cell.configure(day: day, isSelected: viewModel.сellsStates[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        viewModel.сellsStates[viewModel.lastSelectedCellIndex] = false
        viewModel.сellsStates[indexPath.row] = true
        viewModel.lastSelectedCellIndex = indexPath.row
        collectionView.reloadData()
        let day = viewModel.days[indexPath.row]
        
        viewModel.fetchSportsGame(selectedDay: day) { [weak self] error in
            self?.tableView.reloadData()
        }
    }
    // СОЗДАТЬ ГИТ ДЛЯ ПРОЕКТА
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sport?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let game = viewModel.sport?.data?[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as? GameTableViewCell {
            cell.configure(game: game)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    
    //MARK: - NAvigation
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

//MARK: - GameTableViewCellDelegate
extension GamesListViewController: GameTableViewCellDelegate {
    func gameTapped(id: Int?) {
        guard let id = id else {
            print("no id for TEAM")
            return
        }
        
        performSegue(withIdentifier: "TeamsDetailsViewController", sender: id)
        
    }
}

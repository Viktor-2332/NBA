//
//  WeatherViewController.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 10.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {
   
    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet var viewModel: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let viewModel: WeatherviewModelProtocol = WeatherviewModel(fetcherWeather: WeatherFetcher(weatherService: WeatherService()))
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        searchBar.showsSearchResultsButton = true
        setupTableView()
    }
    
    //MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchWeather(weatherSearchText: searchBar.text ?? "") { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                UIAlertController.show(title: "Error", message: error.localizedDescription, view: self)
                print("no")
            } else  {
                self.tableView.reloadData()
            }
        }
    }
    func setupTableView()  {
        tableView.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")
        tableView.register(UINib(nibName: "CoordWeatherTableviewCell", bundle: nil), forCellReuseIdentifier: "CoordWeatherTableviewCell")
        tableView.register(UINib(nibName: "TwoHorizontalLabelsTableViewCell", bundle: nil), forCellReuseIdentifier: "TwoHorizontalLabelsTableViewCell")
        tableView.register(UINib(nibName: "CountryWeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryWeatherTableViewCell")
         tableView.register(UINib(nibName: "MainWeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "MainWeatherTableViewCell")
         tableView.register(UINib(nibName: "WindWeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WindWeatherTableViewCell")
        tableView.register(UINib(nibName: "GraficWeaherTableViewCell", bundle: nil), forCellReuseIdentifier: "GraficWeaherTableViewCell")
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

    }

}

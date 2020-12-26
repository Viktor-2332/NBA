
//  GamesListViewModel.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 22.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import Foundation


protocol GamesListViewModelProtocol: AnyObject {
    var sport: GameListResponse? {get}
    var monthTitle: String {get}
    var days: [DayObject] {get}
    var selectedDay: DayObject? {get}
    var сellsStates: [Bool] { get set}
    var lastSelectedCellIndex: Int {get set}
    
    func fetchSportsGame(selectedDay: DayObject, completion: @escaping ((Error?) ->()))
}

class GamesListViewModel: GamesListViewModelProtocol {
    var monthTitle: String = ""

    var selectedDay: DayObject?
    private(set) var days: [DayObject] = []
    var сellsStates = [Bool]()
    var lastSelectedCellIndex = 0
    
    var sport: GameListResponse?
    private(set) var nbaFetch: SportFetcherGamesProtocol
    
    //MARK: - Initialization
    
    init(nbafetch: SportFetcher) {
        self.nbaFetch = nbafetch
        
        prepareDays()
    }
    
    //MARK: - GamesListViewModelProtocol
    
    func fetchSportsGame(selectedDay: DayObject, completion: @escaping ((Error?) ->())) {
        self.selectedDay = selectedDay
        nbaFetch.fetchAllGames(day: selectedDay) { result in
            switch result {
            case .success(let sport):
                self.sport = sport
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    //private
    private func prepareDays() {
        var date = Date()
        
        let days = date.getAllDays()
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MMMM yyyy"
        monthTitle = dateFormatter.string(from: date)
     
        // преобразуем массив дат [Date] в масив dayObject [DayObject]
        
        // 1 вариант
//        let daysObjects3 = days.compactMap({DayObject(dayName: dateFormatter.string(from: $0), dayNumber: (days.firstIndex(of: $0) ?? 0) + 1)})
//        //2 вариант
//        let daysObjects = days.compactMap { date -> DayObject in
//            let dayName = dateFormatter.string(from: date)
//            let dayNumber = (days.firstIndex(of: date) ?? 0) + 1
//            return DayObject(dayName: dayName, dayNumber: dayNumber)
//        }
        //3 вариант
        var dayObjects: [DayObject] = []
        for (index, day) in days.enumerated() {
            if index == 0 {
                сellsStates.append(true)
            } else {
                сellsStates.append(false)
            }
            dateFormatter.dateFormat = "E"
            let dayName = dateFormatter.string(from: day)
            let dayNumber = index + 1
            dateFormatter.dateFormat = "YYYY-MM-dd"
            let dayFormat = dateFormatter.string(from: day)
            let dayObject = DayObject(dayName: dayName, dayNumber: dayNumber, formattedParameter: dayFormat)
            dayObjects.append(dayObject)
        }
        self.days = dayObjects
        
    }
}


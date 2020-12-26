//
//  GraficWeaherTableViewCell.swift
//  NewsSports
//
//  Created by Виктор Ильюкевич on 17.11.2020.
//  Copyright © 2020 Виктор Ильюкевич. All rights reserved.
//

import UIKit

class GraficWeaherTableViewCellObject {
    
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var timezone: Int?
    var pressure: Int?
    var visibility: Int?
    var humidity: Int?
    
    init(from: WeatherResponse) {
        self.temp = from.main?.temp
        self.feelsLike = from.main?.feelsLike
        self.tempMin = from.main?.tempMin
        self.tempMax = from.main?.tempMax
        self.timezone = from.timezone
        self.visibility = from.visibility
        self.humidity = from.main?.humidity
    }
}

class GraficWeaherTableViewCell: UITableViewCell {

    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var feelsLikeLabel: UILabel!
    @IBOutlet private weak var tempMinLabel: UILabel!
    @IBOutlet private weak var tempMaxLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var pressureButton: UIButton!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var visibilityLabel: UILabel!
    @IBOutlet private weak var visibilityButton: UIButton!
    @IBOutlet private weak var MonthDayLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var humidityButton: UIButton!
    @IBOutlet private weak var weatherImage: UIImageView!
    
    private var timer: Timer?
    var dateFormatter = DateFormatter()
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dateFormatter.dateFormat = "HH:mm"
        self.timeLabel.text = self.dateFormatter.string(from: Date())
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.dateFormatter.dateFormat = "HH:mm"
            self.timeLabel.text = self.dateFormatter.string(from: Date())
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func calculateCelsius(fahrenheit: Double) -> Double { // это не опциональное значение, значит в леэбле его не надо разворачить через ?? 0
        var celsius: Double
        
        celsius = (fahrenheit - 32) * 5 / 9

        return celsius
    }
    
    func configure(object: GraficWeaherTableViewCellObject) {
        let tempCelcius = calculateCelsius(fahrenheit: object.temp ?? 0) // еще раз -
        temperatureLabel.text = String(format: "%.0f°C", tempCelcius)
        feelsLikeLabel.text = "\(object.feelsLike ?? 0)"
        tempMinLabel.text = "\(object.tempMin ?? 0)"
        tempMaxLabel.text = "\(object.tempMax ?? 0)"
        pressureLabel.text = "\(object.pressure ?? 0)"
        visibilityLabel.text = "\(object.visibility ?? 0)"
        humidityLabel.text = "\(object.humidity ?? 0)"
        dateFormatter.dateFormat = "yyyy-mm-dd"
        MonthDayLabel.text = dateFormatter.string(from: Date())

//        weatherImage.image = object.self
        
    }
    
    //MARK: - Actions
    
    @IBAction private func humiditiButtonAction(_ sender: Any) {
    }
    @IBAction private func visibilityButtonAction(_ sender: Any) {
    }
    @IBAction private func pressureButtonAction(_ sender: Any) {
    }
    
}

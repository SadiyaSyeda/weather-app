//
//  WeatherHomeController.swift
//  WeatherApp
//
//  Created by Sadiya Syeda on 12/7/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

class WeatherHomeController: UIViewController {

    @IBOutlet weak var weatherHomeTableView: UITableView!
    var weatherHomeDataSource: WeatherHomeDataSource?
    
    var weatherViewModel : WeatherViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.weatherHomeTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getWeather()
    }
    
  private func getWeather() {
        HomeWeatherService.sharedInstanceHomeService.getWeatherData {[weak self] (weather) in
            guard let this = self else {return}
            this.weatherViewModel = WeatherViewModel(model: weather)
        }
    }
}
private extension WeatherHomeController {
    func setupView() {
        weatherHomeDataSource = WeatherHomeDataSource(weatherHomeVC: self)
        weatherHomeTableView.dataSource = weatherHomeDataSource
//        weatherHomeTableView?.register(CurrentCityCell.self, forCellReuseIdentifier: CurrentCityCell.reuseIdentifier())
        
        let nibName = UINib(nibName: "CurrentCityCell", bundle: nil)
        weatherHomeTableView.register(nibName, forCellReuseIdentifier: "currentCityCell")
    }
}

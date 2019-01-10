//
//  WeatherHomeDataSource.swift
//  WeatherApp
//
//  Created by Sadiya Syeda on 12/7/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

class WeatherHomeDataSource: NSObject {

    var weatherHomeVC: WeatherHomeController
    init(weatherHomeVC: WeatherHomeController){
        self.weatherHomeVC = weatherHomeVC
    }
}

extension WeatherHomeDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let weatherSections = weatherHomeVC.weatherViewModel?.numberOfSections()
            else {return 0}
        return weatherSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       guard let section = weatherHomeVC.weatherViewModel?.numberOfSections(),
        let numberOfWeatherRowsInSection = weatherHomeVC.weatherViewModel?.numberOfRows(section: section) else {return 0}
        return numberOfWeatherRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "currentCityCell", for: indexPath) as? CurrentCityCell else { return UITableViewCell() }
        
        guard let weather = weatherHomeVC.weatherViewModel?.viewModel() else {
            return UITableViewCell()
        }
        cell.configure(weatherModel: weather)
        return cell 
    }
}

//
//  CurrentCityCell.swift
//  WeatherApp
//
//  Created by Sadiya Syeda on 12/7/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

class CurrentCityCell: UITableViewCell {

    @IBOutlet weak var currentCityCell: UIView!
    @IBOutlet weak var currentCityName: UILabel!
    
    func configure(weatherModel: Weather?) {
        guard let model = weatherModel else {return}
        currentCityName.text = model.currentCity
    }
    
}

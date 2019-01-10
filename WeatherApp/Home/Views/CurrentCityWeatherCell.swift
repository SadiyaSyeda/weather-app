//
//  CurrentCityWeatherCell.swift
//  WeatherApp
//
//  Created by Sadiya Syeda on 12/7/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

class CurrentCityWeatherCell: UITableViewCell {
    
    @IBOutlet var currentCityWeatherView: UIView!
    @IBOutlet weak var currentCityLabel: UILabel!
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    class func reuseIdentifier() -> String {
        return "CurrentCityWeatherCell"
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("CurrentCityWeather", owner: self, options: nil)
        addSubview(currentCityWeatherView)
    }
    
    func configure(weatherModel: Weather?) {
        guard let model = weatherModel else {return}
        currentCityLabel.text = model.currentCity
    }
}

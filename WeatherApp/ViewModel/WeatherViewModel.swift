//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Sadiya Syeda on 12/7/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

struct Weather {
    let currentCity: String?
}

struct WeatherViewModel {
    var model: WeatherModel?
    init(model: WeatherModel?){
        self.model = model
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(section: Int ) -> Int {
        return 1
    }
    
    func viewModel() -> Weather? {
        let city = getCurrentCity(city: model?.city?.name)
        let weatherModel = Weather(currentCity: city)
        return weatherModel
    }
}

private extension WeatherViewModel {
    func getCurrentCity(city: String?) -> String {
        return city ?? " "
    }
}

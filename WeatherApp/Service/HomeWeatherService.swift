//
//  HomeWeatherService.swift
//  WeatherApp
//
//  Created by Sadiya Syeda on 12/7/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

class HomeWeatherService {
    static let sharedInstanceHomeService = HomeWeatherService()
    let url = "https://samples.openweathermap.org/data/2.5/forecast?zip=94040&appid=b6907d289e10d714a6e88b30761fae22"
    private var model : WeatherModel?
    
    func getWeatherData(completion: @escaping(WeatherModel?) -> Void) {
        guard let url = URL(string: url) else {return}
        request(url: url, completion: completion)
        }
    
    func request(url: URL, completion: @escaping(WeatherModel?)->Void){
        let task = URLSession.shared.dataTask(with: url) {(data,response,error) in
            guard error == nil, let data=data, let weatherDetails = self.weatherParse(data: data) else {return}
            completion(weatherDetails)
        }
        task.resume()
    }
    
    func weatherParse(data: Data) -> WeatherModel? {
        do{
            let decodedWeather = try JSONDecoder().decode(WeatherModel.self, from: data)
            return decodedWeather
        }
        catch {
            assertionFailure("Failed to decode")
            return model
        }
    }
}

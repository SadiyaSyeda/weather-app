//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Sadiya Syeda on 12/7/18.
//  Copyright © 2018 Sadiya Syeda. All rights reserved.
//

import UIKit

struct WeatherModel: Decodable {
    let list: [List?]
    let city: City?
    
    enum CodingKeys: String,CodingKey {
        case list = "list"
        case city = "city"
    }
}

struct List: Decodable {
    
}

struct City: Decodable {
    let name: String?
    
    enum CodingKeys: String,CodingKey {
        case name = "name"
    }
}

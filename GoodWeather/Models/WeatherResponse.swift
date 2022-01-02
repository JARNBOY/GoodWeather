//
//  WeatherResponse.swift
//  GoodWeather
//
//  Created by Papon Supamongkonchai on 2/1/2565 BE.
//

import Foundation

struct WeatherResponse:Decodable{
    let main:Weather
    
}


struct Weather:Decodable{
    let temp: Double
    let humidity : Double
    
}

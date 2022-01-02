//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Papon Supamongkonchai on 2/1/2565 BE.
//

import Foundation

class WeatherListViewModel{
//    private var weatherViewModels = [WeatherViewModel]()
//     
//    func addWeatherViewModel(vm:WeatherViewModel){
//        weatherViewModels.append(vm)
//    }
//    
//    func
}

class WeatherViewModel{
    let weather :WeatherResponse
    
    init(weather:WeatherResponse){
        self.weather = weather
    }
    
    var city :String{
        return weather.name
    }
    
    var temperature: Double{
        return weather.main.temp
    }
}

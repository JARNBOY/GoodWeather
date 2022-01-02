//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Papon Supamongkonchai on 2/1/2565 BE.
//

import Foundation

class WeatherListViewModel{
    private var weatherViewModels = [WeatherViewModel]()
     
    func addWeatherViewModel(vm:WeatherViewModel){
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(section:Int) -> Int{
        return weatherViewModels.count
    }
    
    func modelAt(index:Int) -> WeatherViewModel{
        return weatherViewModels[index]
    }
    
    func updateUnit(to unit:Unit){
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    private func toCelsius(){
        weatherViewModels = weatherViewModels.map { vm    in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5 / 9
            return weatherModel
        }
    }
    
    private func toFahrenheit(){
        weatherViewModels = weatherViewModels.map { vm    in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9 / 5) + 32
            return weatherModel
        }
    }
}

class WeatherViewModel{
    let weather :WeatherResponse
    var temperature: Double
    init(weather:WeatherResponse){
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
    var city :String{
        return weather.name
    }
}

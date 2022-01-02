//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by Papon Supamongkonchai on 2/1/2565 BE.
//

import Foundation

class AddWeatherViewModel{
    
    func addWeather(for city:String,completion:@escaping (WeatherViewModel) -> Void){
        let weatherUrl = Constants.Urls.urlForWeatherByCity(city: city)
        let weatherResource = Resource<WeatherResponse>(url: weatherUrl) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        Webservice().load(resource: weatherResource) { result in
            if let weatherResource = result{
                let vm = WeatherViewModel(weather:weatherResource)
                completion(vm)
                
            }
        }
    }
}

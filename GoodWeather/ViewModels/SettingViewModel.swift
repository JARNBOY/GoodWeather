//
//  SettingViewModel.swift
//  GoodWeather
//
//  Created by Papon Supamongkonchai on 2/1/2565 BE.
//

import Foundation

enum Unit:String, CaseIterable{
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit{
    var display:String{
        get{
            switch self{
                
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingViewModel{
    
    let units = Unit.allCases
    var selectedUnit:Unit{
        get{
            let userDefault = UserDefaults.standard
            var unitValue = ""
            if let value = userDefault.value(forKey: "unit") as? String{
                unitValue = value
            }
            return Unit(rawValue: unitValue) ?? .celsius
        }
        set{
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue,forKey: "unit")
        }
    }
}

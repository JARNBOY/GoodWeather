//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Papon Supamongkonchai on 2/1/2565 BE.
//

import UIKit

protocol AddWeatherCityViewController_Delegate{
    func addWeatherDidSave(vm:WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cityNameTextField: UITextField!
    private var addWeatherVM = AddWeatherViewModel()
    var delegate:AddWeatherCityViewController_Delegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityNameTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save_click(_ sender: Any) {
        if let city = cityNameTextField.text{
            print("save_click -> city = \(city)")
            addWeatherVM.addWeather(for: city) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func close_clickj(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

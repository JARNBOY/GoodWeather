//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Papon Supamongkonchai on 2/1/2565 BE.
//

import UIKit

class AddWeatherCityViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save_click(_ sender: Any) {
        if let city = cityNameTextField.text{
            let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=587faf23c5198901c5deb6a86fbf6308")!
            let weatherResource = Resource<Any>(url: weatherUrl) { data in
                return data
            }
            
            Webservice().load(resource: weatherResource) { result in
                 
            }
        }
    }
    
    @IBAction func close_clickj(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

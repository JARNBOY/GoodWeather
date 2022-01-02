//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Papon Supamongkonchai on 2/1/2565 BE.
//

import UIKit

class WeatherListTableViewController: UITableViewController,AddWeatherCityViewController_Delegate,SettingsTableViewController_Delegate {
    
    private var weatherListViewModels = WeatherListViewModel()
    private var lastUnitsSelected :Unit = .celsius
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let userDefault = UserDefaults.standard
        if let value = userDefault.value(forKey: "unit") as? String{
            self.lastUnitsSelected = Unit(rawValue: value) ?? .celsius
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherListViewModels.numberOfRows(section: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        let weatherVM = weatherListViewModels.modelAt(index: indexPath.row)

        cell.configure(vm: weatherVM)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController"{
            prepareSegueForAddWeatherCityViewController(segue:segue)
        }else if  segue.identifier == "SettingsTableViewController"{
            prepareSegueForSettingsViewController(segue:segue)
        }
    }
    
    func prepareSegueForAddWeatherCityViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("Navigation Controller Not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else{
            fatalError("AddWeatherCityViewController Not found")
        }
        
        addWeatherCityVC.delegate = self
    }
    
    func prepareSegueForSettingsViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("Navigation Controller Not found")
        }
        
        guard let settingsVC = nav.viewControllers.first as? SettingsTableViewController else{
            fatalError("SettingsTableViewController Not found")
        }
        
        settingsVC.delegate = self
    }

    // MARK: - AddWeatherCityViewController_Delegate
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModels.addWeatherViewModel(vm: vm)
        self.tableView.reloadData()
    }
    
    // MARK: - SettingsTableViewController_Delegate
    func settingsDone(vm:SettingViewModel){
        if lastUnitsSelected.rawValue != vm.selectedUnit.rawValue{
            self.weatherListViewModels.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastUnitsSelected =  Unit(rawValue: vm.selectedUnit.rawValue) ?? .celsius
        }
    }
}

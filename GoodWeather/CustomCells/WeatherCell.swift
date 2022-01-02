//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Papon Supamongkonchai on 2/1/2565 BE.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTemporary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

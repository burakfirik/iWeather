//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by Burak Firik on 2/16/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
  @IBOutlet weak var weatherIcon: UIImageView!
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var weatherType: UILabel!
  @IBOutlet weak var highTemp: UILabel!
  @IBOutlet weak var lowTemp: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  func configureCell(forecast : Forecast) {
    lowTemp.text = "\(forecast.lowTemp)"
    highTemp.text = "\(forecast.highTemp)"
    weatherType.text = forecast.weatherType
    weatherIcon.image = UIImage(named: forecast.weatherType)
    dayLabel.text = forecast.date
  }
  

}

//
//  
//  rainyshinycloudy
//
//  Created by Burak Firik on 2/15/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var currentTempLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var currentWeatherImage: UIImageView!
  @IBOutlet weak var currentWeatherTypeLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  var currentWeather:CurrentWeather!
  var forecast: Forecast!
  var forecasts = [Forecast]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    
    currentWeather = CurrentWeather()
   
    
    currentWeather.downloadWeatherDetails {
      // write code
      self.downloadForecaseData {
          self.updateMainUI()
        
      }
    
    }
    
    //print("selam")
  }

  func downloadForecaseData(completed: @escaping DownloadComplete) {
    
    let forecastURL = URL(string: FORECAST_URL)!
    Alamofire.request(forecastURL).responseJSON { response in
      
      let result = response.result
      
      if let dict = result.value as? Dictionary<String, AnyObject> {
        if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
          for obj in list {
            let fcast  = Forecast(weatherDict: obj)
            self.forecasts.append(fcast)
            print(obj)
          }
          self.forecasts.remove(at: 0)
          self.tableView.reloadData()
        }
      }
    
      completed()
     
    }
  }
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return forecasts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
      let forecst = forecasts[indexPath.row]
      cell.configureCell(forecast: forecst)
      return cell
    } else {
      return WeatherCell()
    }
    
  
  }
  
  func updateMainUI() {
    self.dateLabel.text = currentWeather.date
   // print(currentWeather.date)
    print("Selam")
    self.currentTempLabel.text = "\(currentWeather.currentTemp)"
    self.currentWeatherTypeLabel.text = currentWeather.weatherType
    self.locationLabel.text = currentWeather.cityName
    //print(currentWeather.cityName)
    self.currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    
  }

}
let weatherv = UIApplication.shared.delegate as? WeatherVC


//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Burak Firik on 2/15/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
  
  
  var _cityName: String!
  var _date: String!
  var _weatherType: String!
  var _currentTemp: Double!

  
  var cityName : String {
    if _cityName == nil {
      _cityName = ""
    }
    return _cityName
  }
  
  var date : String {
    if _date == nil {
      _date = ""
    }
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .long
    dateFormatter.timeStyle = .none
    
    let currentDate = dateFormatter.string(from: Date())
    
    self._date = "Today, \(currentDate)"
    
    return _date
  }
  
  var weatherType : String {
    if _weatherType == nil {
      _weatherType = ""
    }
    return _weatherType
  }
  
  var currentTemp : Double {
    if _currentTemp == nil {
      _currentTemp = 0.0
    }
    return _currentTemp
  }
  
  
  func downloadWeatherDetails(completed: @escaping DownloadComplete) {
    let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
    Alamofire.request(currentWeatherURL).responseJSON { response in
      let result = response.result
      print(response)
      
      if let dict = result.value as? Dictionary<String , AnyObject> {
        if let name = dict["name"] as? String {
          self._cityName = name.capitalized
          print(self._cityName)
        }
        
        if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
          if let main = weather[0]["main"] as? String {
            self._weatherType = main.capitalized
            print(self._weatherType)
          }
        }
        
        if let main = dict["main"] as? Dictionary<String, AnyObject> {
          if let temp = main["temp"] as? Double {
            let kelvinToFarenheitPreDiv = (temp * (9.0 / 5.0) - 459.67)
            
            let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDiv / 10))
            
            self._currentTemp = kelvinToFarenheit
            print(self._currentTemp)
            
          }
        }
        
        
      }
      
      completed()

      
    }
    
  }
  
}

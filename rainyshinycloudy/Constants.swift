//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Burak Firik on 2/15/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import Foundation
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat=-33"
let LONGITUDE = "&lon=123"
let APP_ID = "&appid="
let APP_KEY = "6e8019b6f246ab07b04fe07a93a01d5c"


typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(APP_ID)\(APP_KEY)"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=-33&lon=123&cnt=10&appid=6e8019b6f246ab07b04fe07a93a01d5c"

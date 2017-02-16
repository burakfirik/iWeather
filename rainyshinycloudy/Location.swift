//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Burak Firik on 2/16/17.
//  Copyright © 2017 Code Path. All rights reserved.
//

import CoreLocation

class Location {
  static var sharedInstance = Location()
  private init() {}
  
  var latitude: Double!
  var longitude: Double!
}

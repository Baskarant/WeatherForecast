//
//  Constants.swift
//  Weather
//
//  Created by Baskaran T on 16/03/17.
//  Copyright © 2017 Baskaran T. All rights reserved.
//

import UIKit


//MARK: Client - (Constants)
extension Client{
    
    //MARK: Constants
    struct Constants{
        
        //MARK: API Key for OpenWeatherMap
        static let ApiKey = "32762b1c414d1ce6df9c5cd8e80e4e58"
        
        //MARK: URLs
        static let ApiScheme = "http"
        static let ApiHost = "api.openweathermap.org"
        static let ApiPath = "/data/2.5/"
        static let Units = "imperial"
        
        //MARK: icon url
        
        static let baseImageURLString = "http://openweathermap.org/img/w/"
    }
    
    struct Colors{
        static let pinkColor = UIColor(red:0.98, green:0.39, blue:0.49, alpha:1.00)
        static let blueColor = UIColor(red:0.54, green:0.76, blue:0.81, alpha:1.00)
    }
    
    //MARK: Methods
    struct Methods {
        
        //MARK: current weather
        static let currentWeather = "weather"
        static let forcastDaily = "forecast/daily"
    }
    
    //MARK: parameter keys
    struct ParameterKeys {
        static let ApiKey = "APPID"
        static let Query = "q"
        static let Units = "units"
    }
    
    //MARK: JSON Response keys
    struct JSONResponseKeys {
        
        //MARK: General & sys
        static let StatusCode = "cod"
        static let name = "name"
        static let country = "country"
        static let sys = "sys"
        static let sunrise = "sunrise"
        static let sunset = "sunset"
        static let dt = "dt"
        
        //MARK: Current weather
        static let weather = "weather"
        static let mainWeather = "main"
        static let weatherDescription = "description"
        static let icon = "icon"
        
        //MARK: temp keys
        static let main = "main"
        static let temp = "temp"
        static let currentTemp = "day"
        static let humidity = "humidity"
        static let temp_max = "max"
        static let temp_min = "min"
        static let pressure = "pressure"
        
        //MARK: wind keys
        static let wind = "wind"
        static let windSpeed = "speed"
        static let windDireccion = "deg"
        static let rain = "rain"
        static let cloud = "clouds"
        
        //MARK: weather list
        static let list = "list"
        
    }
}









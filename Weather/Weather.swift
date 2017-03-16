//
//  Weather.swift
//  Weather
//
//  Created by Baskaran T on 16/03/17.
//  Copyright © 2017 Baskaran T. All rights reserved.
//

import Foundation

struct Weather{
    
    //MARk: Properties
    
    //main keys
    let temp: Double?
    let humidity: Int?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Double?
    let rain: Double?
    let clouds: Int?
    let speed: Double?
    let dateTIme: Double?
    
    //weather keys
    let main: String?
    let icon: String?
    let weaDescription: String?
    
    
    
    init(dictionary: [String:AnyObject]){
        
        humidity = dictionary[Client.JSONResponseKeys.humidity] as? Int
        pressure = dictionary[Client.JSONResponseKeys.pressure] as? Double
        rain = dictionary[Client.JSONResponseKeys.rain] as? Double
        speed = dictionary[Client.JSONResponseKeys.windSpeed] as? Double
        clouds = dictionary[Client.JSONResponseKeys.cloud] as? Int
        dateTIme = dictionary[Client.JSONResponseKeys.dt] as? Double
        
        if let main = dictionary[Client.JSONResponseKeys.temp] as? [String:AnyObject]{
            temp = main[Client.JSONResponseKeys.currentTemp] as? Double
            temp_max = main[Client.JSONResponseKeys.temp_max] as? Double
            temp_min = main[Client.JSONResponseKeys.temp_min] as? Double
        }else{
            temp = 0.0
            temp_max = 0.0
            temp_min = 0.0
        }
        
        if let weather = dictionary[Client.JSONResponseKeys.weather] as? [[String:AnyObject]]{
            main = weather[0][Client.JSONResponseKeys.mainWeather] as? String
            icon = weather[0][Client.JSONResponseKeys.icon] as? String
            weaDescription = weather[0][Client.JSONResponseKeys.weatherDescription] as? String
        }else{
            main = ""
            icon = ""
            weaDescription = ""
        }
        
    }
    
    //MARK: helper methods
    static func weatherFromResult(_ results: [[String:AnyObject]]) -> [Weather]{
        
        var weathers = [Weather]()
        
        for result in results{
            weathers.append(Weather(dictionary: result))
        }
        
        return weathers
    }
    
    //conver temp from kelvin to fah
    static func fFrom(kelvin value: Double) -> Int?{
        return Int((1.8 * (value - 273) + 32).rounded())
    }
    
    //unix time conversion
    static func unixTimeConvertion(unixTime: Double, format: String) -> String {
        let time = NSDate(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone(name: "America/Chicago") as TimeZone!
        dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.system.identifier) as Locale!
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: time as Date)
    }
    
    
    
}

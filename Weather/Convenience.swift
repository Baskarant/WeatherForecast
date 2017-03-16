//
//  Convenience.swift
//  Weather
//
//  Created by Baskaran T on 16/03/17.
//  Copyright © 2017 Baskaran T. All rights reserved.
//

import Foundation
import UIKit

extension Client{
    
    // MARK: GET current weather Methods
    
    func getForcastByCity(_ searchString: String, completionHandlerForWeather: @escaping (_ result: [Weather]?, _ error: NSError?) -> Void) -> URLSessionDataTask? {
        
        /* Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [Client.ParameterKeys.Query: searchString, Client.ParameterKeys.Units: Client.Constants.Units]
        
        /* Make the request */
        let task = taskForGETMethod(Methods.forcastDaily, parameters: parameters as [String:AnyObject]) { (results, error) in
            
            /*  Send the desired value(s) to completion handler */
            if let error = error {
                completionHandlerForWeather(nil, error)
            } else {
                
                if let results = results?[Client.JSONResponseKeys.list] as? [[String:AnyObject]] {
                    
                    let weather = Weather.weatherFromResult(results)
                    completionHandlerForWeather(weather, nil)
                } else {
                    completionHandlerForWeather(nil, NSError(domain: "getWeatherByCity parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getWeatherByCity"]))
                }
            }
        }
        
        return task
    }
    
}

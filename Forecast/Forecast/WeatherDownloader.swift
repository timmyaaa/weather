//
//  WeatherDownloader.swift
//  Forecast
//
//  Created by Oleg Marchik on 2/10/17.
//  Copyright © 2017 Oleg Marchik. All rights reserved.
//

import Foundation

class WeatherDownloader {
    
    static let sharedInstance = WeatherDownloader()
    
    func requestWeather(latitude: Double, longitude:Double, comlition: @escaping (_ weatherData:WeatherData) -> ()) {
        guard let url = URL(string: Constants.OpenWeatherMap.weatherByCoordinatesURL(latitude: latitude, longitude: longitude)) else { return }
        print(url)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { (data, responce, error) in
            if let data = data, error == nil {
                guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, AnyObject> else { return }
                print(json)
                let city = json?["name"] as? String
                let type = (json?["weather"] as? Array<Dictionary<String, AnyObject>>)?[0]["description"] as? String
                
                let temp = (json?["main"] as? Dictionary<String, AnyObject>)?["temp"] as? Double
                
                DispatchQueue.main.async {
                    comlition(WeatherData(cityName: city, temprature: temp, type: type))
                }
            }
        }
        
        dataTask.resume()
        
    }
}

//
//  TodayWeatherModel.swift
//  CardWeather
//
//  Created by 黄永乐 on 2018/2/3.
//  Copyright © 2018年 黄永乐. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 area = "\U6210\U90fd";
 areaid = 101270101;
 temperature = 3;
 time = 201802041000;
 weather = "\U5c0f\U96e8";
 "weather_code" = 07;
 "wind_direction" = "\U5317\U98ce";
 "wind_power" = "0-3\U7ea7 \U5fae\U98ce  <5.4m/s";
 */


struct TodayWeatherModel: Mappable {
    var area: String?
    var temperature: String?
    var time: String?
    var weather: String?
    var weatherCode: String?
    var windDirection: String?
    var windPower: String?
    var dayTime: CurrentDayTime = Date.dayTime
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        area             <- map["area"]
        temperature      <- map["temperature"]
        time             <- map["time"]
        weather          <- map["weather"]
        weatherCode      <- map["weather_code"]
        windDirection    <- map["wind_direction"]
        windPower        <- map["wind_power"]
    }
}

extension TodayWeatherModel {
    
    var toEnglish: String {
        if let weather = weather {
            if weather.contains("雨") {
                return "rain"
            } else if weather.contains("雪") {
                return "snow"
            } else {
                return "cloud"
            }
        }
        return ""
    }
    
    var imageName: String {
        return toEnglish + dayTime.rawValue + "_bg"
    }
}

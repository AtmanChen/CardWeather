//
//  WeatherForeCastModel.swift
//  CardWeather
//
//  Created by 黄永乐 on 2018/2/3.
//  Copyright © 2018年 黄永乐. All rights reserved.
//

import Foundation
import ObjectMapper

/*
 "night_weather_code": "01",
 "day_weather": "多云",//白天天气
 "night_weather": "多云",//晚上天气
 "night_wind_power": "微风",//风力
 "day_wind_power": "微风",//风力
 "day_weather_code": "01",//天气编码
 "daytime": "20161106",//预报时间
 "day_weather_pic": "http://appimg.showapi.com/images/weather/icon/day/01.png",//白天天气图标
 "night_air_temperature": "21",//晚上气温
 "day_air_temperature": "27",//白天气温
 "day_wind_direction": "无持续风向",//白天风力
 "night_weather_pic": "http://appimg.showapi.com/images/weather/icon/night/01.png",//晚上天气图标
 "night_wind_direction": "北风"//晚上风力
 */

/*
 area = "\U6210\U90fd";
 areaid = 101270101;
 "day_air_temperature" = 4;
 "day_weather" = "\U5c0f\U96e8";
 "day_weather_code" = 07;
 "day_weather_pic" = "http://app1.showapi.com/weather/icon/day/07.png";
 "day_wind_direction" = "\U65e0\U6301\U7eed\U98ce\U5411";
 "day_wind_power" = "0-3\U7ea7";
 daytime = 20180204;
 "night_air_temperature" = 0;
 "night_weather" = "\U96e8\U5939\U96ea";
 "night_weather_code" = 06;
 "night_weather_pic" = "http://app1.showapi.com/weather/icon/night/06.png";
 "night_wind_direction" = "\U65e0\U6301\U7eed\U98ce\U5411";
 "night_wind_power" = "0-3\U7ea7";
 */

struct WeatherForecastModel: Mappable {
    
    var area: String?
    
    var dayTemp: String?
    var dayWeather: String?
    var dayWeatherCode: String?
    var dayWindDirection: String?
    var dayWindPower: String?
    
    var nightTemp: String?
    var nightWeather: String?
    var nightWeatherCode: String?
    var nightWindDirection: String?
    var nightWindPower: String?
    
    init?(map: Map) {
        
    }
    
    
    mutating func mapping(map: Map) {
        area                <- map["area"]
        dayWeather          <- map["day_weather"]
        dayTemp             <- map["day_air_temperature"]
        dayWeatherCode      <- map["day_weather_code"]
        dayWindDirection    <- map["day_wind_direction"]
        dayWindPower        <- map["day_wind_power"]
        nightWeather        <- map["night_weather"]
        nightTemp           <- map["night_air_temperature"]
        nightWeatherCode    <- map["night_weather_code"]
        nightWindDirection  <- map["night_wind_direction"]
        nightWindPower      <- map["night_wind_power"]
    }
}

extension WeatherForecastModel {
    var graidentColors: [UIColor] {
        guard let dayWeather = dayWeather else {
            return UIColor.defaultGradient()
        }
        if dayWeather.contains("晴") || dayWeather.contains("云") {
            return UIColor.sunGradient()
        } else if dayWeather.contains("雨") {
            return UIColor.rainGradient()
        } else if dayWeather.contains("雪") {
            return UIColor.snowGradient()
        } else {
            return UIColor.otherGradient()
        }
    }
}


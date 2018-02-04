//
//  WeatherTool.swift
//  CardWeather
//
//  Created by 黄永乐 on 2018/2/3.
//  Copyright © 2018年 黄永乐. All rights reserved.
//
import Foundation

private let baseUrl = "https://ali-weather.showapi.com/"
private let appCode = "9868bce1b60247f7ba4773e5eb5f55e8"

enum WeatherRequestType: String {
    case forecast = "day15"
    case today = "hour24"
    
    func query(_ cityName: String) -> String {
        let queryBase = "?area="
        let queryDetail = cityName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return queryBase + queryDetail!
    }
}

struct WeatherAPIManager {
    static let shared = WeatherAPIManager()
    func weatherInformation<M>(cityName: String,
                               requestType: WeatherRequestType,
                               success: @escaping (M) -> Void,
                               fail: @escaping (String) -> Void) {
        let urlString = "\(baseUrl)" + requestType.rawValue + requestType.query(cityName)
        let url = URL(string: urlString)!
        let request = NSMutableURLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: TimeInterval(8))
        request.httpMethod = "GET"
        request.addValue("APPCODE \(appCode)", forHTTPHeaderField: "Authorization")
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard error == nil else {
                fail(error!.localizedDescription)
                return
            }
            if let data = data {
                let dataBody: [String: AnyObject]? = (try? JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions())) as? [String: AnyObject]
                if let body = dataBody {
                    let apiBody = body["showapi_res_body"] as? [String: AnyObject]
                    switch requestType {
                    case .forecast:
                        print(apiBody ?? [:])
                    case .today:
                        print(apiBody ?? [:])
                    }
                    
                } else {
                    fail("解析失败")
                }
            }
        }
        dataTask.resume()
    }
}






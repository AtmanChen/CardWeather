//
//  ViewController.swift
//  CardWeather
//
//  Created by 黄永乐 on 2018/2/3.
//  Copyright © 2018年 黄永乐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherAPIManager.shared.weatherInformation(cityName: "成都", requestType: .forecast, success: { (models: [WeatherForecastModel]) in
            
        }) { (errorMsg) in
            print(errorMsg)
        }
    }


}


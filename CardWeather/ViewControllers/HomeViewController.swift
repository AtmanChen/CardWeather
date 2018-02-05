//
//  ViewController.swift
//  CardWeather
//
//  Created by 黄永乐 on 2018/2/3.
//  Copyright © 2018年 黄永乐. All rights reserved.
//

import UIKit
import Pastel
import Then

class HomeViewController: UIViewController {
    
    // MARK: property
    fileprivate var pastelView: PastelView!
    
    // MARK:
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }

    private func initUI() {
        
        title = Date.weekDayInChinese()
        // 导航栏透明
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        // 渐变背景
        pastelView = PastelView(frame: view.bounds)
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        pastelView.animationDuration = 3.0
        pastelView.setColors(UIColor.otherGradient())
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
        
        // 左侧导航栏按钮
        let leftBarButtonItem = CustomRotateButtonItem(normalImage: #imageLiteral(resourceName: "settings"), selectedImage: #imageLiteral(resourceName: "close"))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
    }
    
    private func initData() {
        
    }
}


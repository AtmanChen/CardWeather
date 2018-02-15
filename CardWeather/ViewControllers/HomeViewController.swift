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

let images = [#imageLiteral(resourceName: "snow_bg_9"), #imageLiteral(resourceName: "snow_bg_6"), #imageLiteral(resourceName: "snow_bg_8"), #imageLiteral(resourceName: "snow_bg_3"), #imageLiteral(resourceName: "snow_bg_2"), #imageLiteral(resourceName: "snow_bg_7"), #imageLiteral(resourceName: "snow_bg_1"), #imageLiteral(resourceName: "sunny_bg_2"), #imageLiteral(resourceName: "sunny_bg_1")]
class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
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
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 导航栏透明
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        // 渐变背景
        pastelView = PastelView(frame: view.bounds)
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        pastelView.animationDuration = 3.0
        pastelView.setColors(UIColor.snowGradient())
        pastelView.startAnimation()
        view.insertSubview(pastelView, at: 0)
        
        // 左侧导航栏按钮
        let leftBarButtonItem = CustomRotateButtonItem(normalImage: #imageLiteral(resourceName: "settings"), selectedImage: #imageLiteral(resourceName: "close"))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
    }
    
    private func initData() {
        
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let collectionView = scrollView as? UICollectionView {
            for cell in collectionView.visibleCells as! [CityWeatherCollectionViewCell] {
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let frame = collectionView.convert(attributes.frame, to: view)
                cell.bgImageView.transform = UIView.transformParallex(in: .vertical, with: frame)
            }
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CityWeatherCollectionViewCell.self)", for: indexPath) as! CityWeatherCollectionViewCell
        cell.bgImageView.image = images[indexPath.item]
        return cell
    }
}


//
//  UIView+ParallexExtension.swift
//  CardWeather
//
//  Created by 黄永乐 on 2018/2/8.
//  Copyright © 2018年 黄永乐. All rights reserved.
//

import UIKit

extension UIView {
    enum ParallexDirection {
        case horizon
        case vertical
    }
    
    static func transformParallex(`in` direction: ParallexDirection, with convertFrame: CGRect) -> CGAffineTransform   {
        var translation: CGFloat!
        let origin = convertFrame.origin
        switch direction {
        case .horizon:
            translation = origin.x / 10
            return CGAffineTransform(translationX: translation, y: 0)
        case .vertical:
            translation = origin.y / 10
            return CGAffineTransform(translationX: 0, y: translation)
        }
        
    }
}

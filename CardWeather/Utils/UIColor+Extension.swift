//
//  UIColor+Extension.swift
//  CardWeather
//
//  Created by 黄永乐 on 2018/2/4.
//  Copyright © 2018年 黄永乐. All rights reserved.
//

import UIKit

extension UIColor {
    static func defaultGradient() -> [UIColor] {
        return [#colorLiteral(red: 0.2746661603, green: 0.2752619088, blue: 0.3999611139, alpha: 1), #colorLiteral(red: 0.6383613944, green: 0.3033242226, blue: 0.5332176685, alpha: 1), #colorLiteral(red: 0.9370609522, green: 0.377220571, blue: 0.6138275266, alpha: 1)]
    }
    
    static func sunGradient() -> [UIColor] {
        return [#colorLiteral(red: 0.9426787496, green: 0.4484152794, blue: 0.5093129277, alpha: 1), #colorLiteral(red: 0.9023083448, green: 0.5503097177, blue: 0.1497696936, alpha: 1), #colorLiteral(red: 0.9935922027, green: 0.8393015265, blue: 0.2872356772, alpha: 1)]
    }
    
    static func rainGradient() -> [UIColor] {
        return [#colorLiteral(red: 0.4405050278, green: 0.2301162481, blue: 0.5298244953, alpha: 1), #colorLiteral(red: 0.2556340098, green: 0.4527288675, blue: 0.8153302073, alpha: 1), #colorLiteral(red: 0.4618732333, green: 0.5891281962, blue: 0.9948682189, alpha: 1)]
    }
    
    static func snowGradient() -> [UIColor] {
        return [#colorLiteral(red: 0.4181150198, green: 0.3952428102, blue: 0.8416710496, alpha: 1), #colorLiteral(red: 0.1837185025, green: 0.6613769531, blue: 0.7342799306, alpha: 1), #colorLiteral(red: 0.2834263444, green: 0.9141005874, blue: 0.5325692296, alpha: 1)]
    }
    
    static func otherGradient() -> [UIColor] {
        return [#colorLiteral(red: 0.6136754155, green: 0.2668370306, blue: 0.7342857122, alpha: 1), #colorLiteral(red: 0.3275671005, green: 0.4989288449, blue: 0.7309731841, alpha: 1), #colorLiteral(red: 0.310552299, green: 0.7621321678, blue: 0.7714813948, alpha: 1)]
    }
}

//
//  Int+Extension.swift
//  CardWeather
//
//  Created by 黄永乐 on 2018/2/4.
//  Copyright © 2018年 黄永乐. All rights reserved.
//

import Foundation



extension Int {
    // MARK: 用于星期
    func unitTranslation() -> String {
        guard self > 0 && self < 8 else {
            return ""
        }
        let chineseString = ["一", "二", "三", "四", "五", "六", "日"]
        return chineseString[self - 1]
    }
}

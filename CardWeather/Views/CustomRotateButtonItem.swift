//
//  CustomImageButtonItem.swift
//  CardWeather
//
//  Created by 黄永乐 on 2018/2/4.
//  Copyright © 2018年 黄永乐. All rights reserved.
//

import UIKit

enum ButtonState {
    case open
    case close
}
private extension ButtonState {
    func oppositeState() -> ButtonState {
        switch self {
        case .close: return .open
        case .open: return .close
        }
    }
    var buttonImage: UIImage {
        switch self {
        case .close: return #imageLiteral(resourceName: "close")
        case .open: return #imageLiteral(resourceName: "settings")
        }
    }
}

// MARK: customView为UIButton
class CustomRotateButtonItem: UIBarButtonItem {
    
    fileprivate let normalImage: UIImage!
    fileprivate let selectedImage: UIImage!
    fileprivate var buttonState: ButtonState = .open
    init(normalImage: UIImage, selectedImage: UIImage) {
        self.normalImage = normalImage
        self.selectedImage = selectedImage
        super.init()
        self.initCustomView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initCustomView() {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        button.setImage(normalImage, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.9839243293, green: 0.8461275101, blue: 0.3668848276, alpha: 1)
        button.layer.cornerRadius = 18.0
        button.layer.masksToBounds = true
        button.adjustsImageWhenHighlighted = false
        customView = button
    }
    
    @objc
    private func buttonTapped(_ sender: UIButton) {
        let currentState = buttonState
        let rotationAngle = CGFloat.pi / 2
        let rotateAnimator = UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.8) {
            sender.imageView?.transform = currentState == .close ? .identity : CGAffineTransform(rotationAngle: rotationAngle)
            self.buttonState = currentState.oppositeState()
            sender.setImage(self.buttonState.buttonImage, for: .normal)
        }
        rotateAnimator.startAnimation()
    }
}

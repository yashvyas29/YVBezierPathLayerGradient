//
//  YVExtensions.swift
//  YVBadge
//
//  Created by Yash Vyas on 01/10/17.
//  Copyright © 2017 Yash Vyas. All rights reserved.
//

import UIKit

class YVExtensions: NSObject {

}

extension UIView {
    
    func setGradient(
        path: UIBezierPath? = nil,
        startColor: UIColor? = .red,
        endColor: UIColor? = .white
        ) {
        
        let gradient = CAGradientLayer()
        let gradientPath = path ?? UIBezierPath(rect: self.bounds)
        gradient.frame = gradientPath.bounds
        
        let gradientShape = CAShapeLayer()
        gradientShape.path = gradientPath.cgPath
        gradient.mask = gradientShape
        
        if let gradientStartColor = startColor?.cgColor, let gradientEndColor = endColor?.cgColor {
            gradient.colors = [gradientStartColor, gradientEndColor]
        }
        
        self.layer.addSublayer(gradient)
    }
    
    func setOutline(
        path: CGPath? = nil,
        width: CGFloat? = 1,
        color: UIColor? = .black) {
        let outlineShape = CAShapeLayer()
        if let outlinePath = path {
            outlineShape.path = outlinePath
        }
        if let outlineWidth = width {
            outlineShape.lineWidth = outlineWidth
        }
        if let outlineColor = color {
            outlineShape.strokeColor = outlineColor.cgColor
        }
        self.layer.addSublayer(outlineShape)
    }
    
    func setShadow(
        color: UIColor? = .lightGray,
        opacity: Float? = 0.8,
        offset: CGSize? = .zero,
        radius: CGFloat? = 4,
        scale: CGFloat? = 0,
        path: CGPath? = nil) {
        
        self.layer.masksToBounds = false
        if let shadowColor = color?.cgColor {
            self.layer.shadowColor = shadowColor
        }
        if let shadowOpacity = opacity {
            self.layer.shadowOpacity = shadowOpacity
        }
        if let shadowOffset = offset {
            self.layer.shadowOffset = shadowOffset
        }
        if let shadowRadius = radius {
            self.layer.shadowRadius = shadowRadius
        }
        if let shadowPath = path {
            self.layer.shadowPath = shadowPath
        }
        if let rasterizationScale = scale {
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = rasterizationScale
        }
    }
}

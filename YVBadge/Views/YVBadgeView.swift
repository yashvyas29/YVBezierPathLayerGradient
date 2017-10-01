//
//  YVBadgeView.swift
//  YVBadge
//
//  Created by Yash Vyas on 01/10/17.
//  Copyright © 2017 Yash Vyas. All rights reserved.
//

import UIKit

@IBDesignable class YVBadgeView: UIView {

    // MARK: - IBInspectable
    @IBInspectable var outlineColor: UIColor = .lightGray
    @IBInspectable var outlineWidth: CGFloat = 4
    @IBInspectable var shadowColor: UIColor = .yellow
    @IBInspectable var shadowWidth: CGFloat = 4
    @IBInspectable var gradientStartColor: UIColor = .red
    @IBInspectable var gradientEndColor: UIColor = .green
    
    // MARK: - IBOutlet
    @IBOutlet weak var lblBadgeName: UILabel?
    @IBOutlet weak var badgeLabelViewHeight: NSLayoutConstraint?
    
    // MARK: - Properties
    var gradientViewHeightMultiplier: CGFloat = 0.85
    
    // MARK: - override
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let width = bounds.width
        if let _ = lblBadgeName {
            badgeLabelViewHeight?.constant = 1 - gradientViewHeightMultiplier
        } else {
            gradientViewHeightMultiplier = 1
        }
        let gradientHeight = bounds.height*gradientViewHeightMultiplier
        
        let gradientPath = UIBezierPath()
        gradientPath.move(to: .zero)
        gradientPath.addLine(to: CGPoint(x: width, y: 0))
        gradientPath.addLine(to: CGPoint(x: width, y: gradientHeight))
        gradientPath.addLine(to: CGPoint(x: width/2, y: gradientHeight*0.75))
        gradientPath.addLine(to: CGPoint(x: 0, y: gradientHeight))
        gradientPath.close()
        
        setOutline(path: gradientPath.cgPath, width: outlineWidth)
        
        setGradient(path: gradientPath, startColor: gradientStartColor, endColor: gradientEndColor)
        
        setShadow(color: shadowColor, radius: shadowWidth)
        
    }
    
}

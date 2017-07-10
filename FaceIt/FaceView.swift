//
//  FaceView.swift
//  FaceIt
//
//  Created by ZhangChuanhui on 7/9/17.
//  Copyright © 2017 ZhangChuanhui. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    override func draw(_ rect: CGRect) {
        let skullRadius = min(bounds.size.width, bounds.size.height) / 2
        let skullCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let skull = UIBezierPath(arcCenter: skullCenter, radius: skullRadius, startAngle: 0.0, endAngle: CGFloat(2*Double.pi), clockwise: false)
        skull.lineWidth = 5.0
        UIColor.red.setStroke()
        skull.stroke()
    }
    
}

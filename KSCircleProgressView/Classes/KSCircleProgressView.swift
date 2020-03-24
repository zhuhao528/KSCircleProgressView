//
//  KSCircleProgressView.swift
//  KSClient
//
//  Created by zhu hao on 2020/2/26.
//  Copyright © 2020 kaishu. All rights reserved.
//

import UIKit

public class KSCircleProgressView: UIView {
    
    struct Constant {
        static let lineWidth: CGFloat = 5
        static let trackColor = UIColor.gray
        static let progressColoar = UIColor.red
    }
    
    let trackLayer = CAShapeLayer()
    let progressLayer = CAShapeLayer()
    let path = UIBezierPath()
    public var progress: Int = 0 {
        didSet {
            if progress > 100 {
                progress = 100
            }else if progress < 0 {
                progress = 0
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override public func draw(_ rect: CGRect) {

        let path = UIBezierPath.init(ovalIn: bounds)
        self.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2);
        
        //绘制进度槽
        trackLayer.frame = bounds
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = Constant.trackColor.cgColor
        trackLayer.lineWidth = Constant.lineWidth
        trackLayer.path = path.cgPath
        layer.addSublayer(trackLayer)
        
        //绘制进度条
        progressLayer.frame = bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = Constant.progressColoar.cgColor
        progressLayer.lineWidth = Constant.lineWidth
        progressLayer.path = path.cgPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = CGFloat(progress)/100.0
        layer.addSublayer(progressLayer)
    }
    
   public func  setProgress(_ pro: Int,animated anim: Bool) {
        if progress == pro {return}
        progress = pro
        setProgress(pro, animated: anim, withDuration: 0.55)
    }
    
    public func setProgress(_ progress: Int,animated anim: Bool, withDuration duration: Double) {
        progressLayer.strokeEnd = CGFloat(progress)/100.0
    }
}

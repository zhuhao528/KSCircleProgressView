//
//  KSDownLoadView.swift
//  KSClient
//
//  Created by zhu hao on 2020/2/26.
//  Copyright © 2020 kaishu. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class KSDownLoadView: UIView {
    
    var disposeBag = DisposeBag()
    
    let progressView = KSCircleProgressView()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("增加", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    lazy var reduceButton: UIButton = {
        let button = UIButton()
        button.setTitle("减少", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configDefaultInit()
        configSubviews()
        configLayoutSubviews()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configDefaultInit()
        configSubviews()
        configLayoutSubviews()
    }

    func configDefaultInit() {
        addButton.rx.tap.subscribe({  [weak self] _ in
            self?.addProgress(progress: 25)
        }).disposed(by: disposeBag)

        reduceButton.rx.tap.subscribe({ [weak self] _ in
            self?.minusProgress(progress: 25)
        }).disposed(by: disposeBag)
    }
    
    func configSubviews() {
        addSubview(addButton)
        addSubview(reduceButton)
        addSubview(progressView)
        addSubview(progressLabel)
    }
    
    func configLayoutSubviews() {
        addButton.snp.makeConstraints { (make) in
            make.left.top.equalTo(100)
            make.width.height.equalTo(50)
        }
        
        reduceButton.snp.makeConstraints { (make) in
            make.top.equalTo(addButton)
            make.left.equalTo(addButton.snp_right).offset(10)
            make.width.height.equalTo(50)
        }
        
        progressView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.centerX.equalTo(self)
            make.width.height.equalTo(70)
        }
        
        progressLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(progressView)
            make.centerY.equalTo(progressView)
        }
    }
}

extension KSDownLoadView {
    
    public func show(fromView:UIView) {
        fromView.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.top.equalTo(self.superview!)
            make.left.equalTo(self.superview!)
            make.width.height.equalTo(self.superview!)
        }
    }
    
    public func dismiss(){
        self.removeFromSuperview()
    }
    
    func addProgress(progress:Int) {
        let num = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                   NSAttributedString.Key.foregroundColor : UIColor.yellow]
        let percent = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                       NSAttributedString.Key.foregroundColor : UIColor.yellow]
        let numString = NSMutableAttributedString(string:String(progress), attributes:num as [NSAttributedString.Key : Any])
        let percentString = NSMutableAttributedString(string:"%", attributes:percent as [NSAttributedString.Key : Any])
        numString.append(percentString)
        progressLabel.attributedText = numString
        progressView.setProgress(self.progressView.progress+progress, animated: true)
    }
    
    func minusProgress(progress:Int) {
        let num = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                   NSAttributedString.Key.foregroundColor : UIColor.yellow]
        let percent = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                       NSAttributedString.Key.foregroundColor : UIColor.yellow]
        let numString = NSMutableAttributedString(string:String(progress), attributes:num as [NSAttributedString.Key : Any])
        let percentString = NSMutableAttributedString(string:"%", attributes:percent as [NSAttributedString.Key : Any])
        numString.append(percentString)
        progressLabel.attributedText = numString
        progressView.setProgress(self.progressView.progress-progress, animated: true)
    }
}


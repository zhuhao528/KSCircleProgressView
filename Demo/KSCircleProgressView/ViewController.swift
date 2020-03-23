//
//  ViewController.swift
//  KSCircleProgressView
//
//  Created by zhu hao on 2020/3/19.
//  Copyright © 2020 zhu hao. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    var donwLoadView: KSDownLoadView = {
        let donwLoadView = KSDownLoadView()
        return donwLoadView
    }()
        
    func configDefaultInit(){
        
    }
    
    func configSubviews(){
        self.view.addSubview(self.donwLoadView)
    }
    
    func configLayoutSubviews(){
        self.donwLoadView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configDefaultInit()
        configSubviews()
        configLayoutSubviews()
    }
}


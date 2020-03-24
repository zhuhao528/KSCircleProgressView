//
//  ViewController.swift
//  KSCircleProgressView
//
//  Created by zhuhao on 03/24/2020.
//  Copyright (c) 2020 zhuhao. All rights reserved.
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


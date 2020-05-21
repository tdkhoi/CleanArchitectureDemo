//
//  MusicViewController.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import UIKit
import RxSwift


protocol MusicViewControllerOutput {
    
}

class MusicViewController: BaseViewController {
    var output: MusicViewControllerOutput?
    var router: MusicRouter!
    
    private var disposeBag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.config()
        
    }
    
    override init() {
        super.init()
        self.config()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.config()
    }
    
    private func config() {
        MusicConfiguration.shared.config(viewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(frame: .zero)
        
        btn >>> view >>> {
            $0.backgroundColor = .darkGray
            $0.setTitle("Route to muisc", for: .normal)
            $0.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.width.equalTo(150)
                make.height.equalTo(44)
            }
        }
        
        btn.rx.tap.bind { [weak self] in
            
            self?.router.close()
            
        }.disposed(by: disposeBag)
        
    }
    
    deinit {
        print("\(self) deinit")
    }
}


extension MusicViewController: MusicPresenterOutput {
    
}

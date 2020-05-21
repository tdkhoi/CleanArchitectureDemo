//
//  HomeViewController.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/19/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

protocol HomeViewControllerOutput {
    func selectSong()
}

class HomeViewController: BaseViewController {
    
    var output: HomeViewControllerOutput?
    var router: HomeRouter!
    
    private lazy var lblTitle = UILabel(frame: .zero)
    
    
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
        HomeConfiguration.shared.config(viewController: self)
    }
    
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        lblTitle >>> view >>> {
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 15, weight: .semibold)
            $0.snp.makeConstraints { (make) in
                make.top.equalTo(30)
                make.centerX.equalToSuperview()
            }
        }
        
        let btn = UIButton(frame: .zero)
        
        btn >>> view >>> {
            $0.backgroundColor = .darkGray
            $0.setTitle("Route to music", for: .normal)
            $0.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
                make.width.equalTo(150)
                make.height.equalTo(44)
            }
        }
        
        btn.rx.tap.bind { [weak self] in
            self?.router.openMusicScene()
            
        }.disposed(by: disposeBag)
        
        let btnSelectSong = UIButton(frame: .zero)
        btnSelectSong >>> view >>> {
            $0.backgroundColor = .darkGray
            $0.setTitle("Select song", for: .normal)
            $0.snp.makeConstraints { (make) in
                make.top.equalTo(btn.snp.bottom).offset(20)
                make.centerX.equalToSuperview()
                make.width.equalTo(150)
                make.height.equalTo(44)
            }
        }
        
        btnSelectSong.rx.tap.bind { [weak self] in
            self?.output?.selectSong()
        }.disposed(by: disposeBag)
        
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

extension HomeViewController: HomePresenterOutput {
    func updateCurrentSong(song: String?) {
        self.lblTitle.text = song
    }
}

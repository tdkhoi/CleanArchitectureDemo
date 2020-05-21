//
//  HomePresenter.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/19/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import RxSwift

protocol HomePresenterOutput: class {
    func updateCurrentSong(song: String?)
}

class HomePresenter {
    weak var output: HomePresenterOutput?
    private var disposeBag = DisposeBag()
    
    private var currentGame: Observable<String?> {
        return store.state.gameState!.$currentGame.asObservable()
    }
    
    init() {
        self.setupRX()
    }
    
    private func setupRX() {
        currentGame.bind {[weak self] (currentGame) in
            self?.output?.updateCurrentSong(song: currentGame)            
        }.disposed(by: disposeBag)
    }
}


extension HomePresenter: HomeInteractorOutput {
    
}

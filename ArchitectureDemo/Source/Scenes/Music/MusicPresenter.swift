//
//  MusicPresenter.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation

protocol MusicPresenterOutput: class {
    
}

class MusicPresenter {
    weak var output: MusicPresenterOutput?
    deinit {
        print("\(self) deinit")
    }
}


extension MusicPresenter: MusicInteractorOutput {
    
}

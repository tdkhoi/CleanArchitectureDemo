//
//  MusicInteractor.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
protocol MusicInteractorOutput {
    
}

class MusicInteractor {
    var output: MusicInteractorOutput?
    deinit {
        print("\(self) deinit")
    }
}

extension MusicInteractor: MusicViewControllerOutput {
    
}

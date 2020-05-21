//
//  MusicConfiguration.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
class MusicConfiguration {
    
    static var shared = MusicConfiguration()
    
    func config(viewController: MusicViewController) {
        let presenter = MusicPresenter()
        presenter.output = viewController
        
        let interactor = MusicInteractor()
        interactor.output = presenter
        
        
        let router = MusicRouter()
        router.viewController = viewController
        
        viewController.output = interactor
        viewController.router = router
        
        
    }
    
}

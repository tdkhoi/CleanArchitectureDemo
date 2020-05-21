//
//  HomeConfiguration.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/19/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation


class HomeConfiguration {
    
    static var shared = HomeConfiguration()
    
    func config(viewController: HomeViewController) {
        let presenter = HomePresenter()
        presenter.output = viewController
        
        let interactor = HomeInteractor()
        interactor.output = presenter
        
        
        let router = HomeRouter()
        router.viewController = viewController
        
        viewController.output = interactor
        viewController.router = router
        
        
    }
    
}

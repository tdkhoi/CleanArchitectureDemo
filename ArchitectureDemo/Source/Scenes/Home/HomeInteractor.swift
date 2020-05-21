//
//  HomeInteractor.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/19/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import ReSwift

protocol HomeInteractorOutput {
    
}

class HomeInteractor {
    var output: HomeInteractorOutput?
}

extension HomeInteractor: HomeViewControllerOutput {
    func selectSong() {
        
        
        
        let action = UpdateCurrentGameAction(currentName: self.randomString(length: 10))
        store.dispatch(action)
    }
    
    private func randomString(length: Int) -> String {

        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)

        var randomString = ""

        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }

        return randomString
    }
}

//
//  GameReducer.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import ReSwift

func gameReducer(action: Action, state: GameState?) -> GameState {
    var state = state ?? GameState()
    
    
    switch action {
    case let action as UpdateCurrentGameAction:
        state.currentGame = action.currentName
    default:
        break
    }
    return state
}



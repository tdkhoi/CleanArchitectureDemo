//
//  MainAppReducer.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import ReSwift


func mainAppReducer(action: Action, state: MainAppState?) -> MainAppState {
  return MainAppState(
    gameState: gameReducer(action: action, state: state?.gameState),
    musicState: musicReducer(action: action, state: state?.musicState)
  )
}


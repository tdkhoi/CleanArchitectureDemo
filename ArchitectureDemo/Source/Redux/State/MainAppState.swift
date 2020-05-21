//
//  MainAppState.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import ReSwift

struct MainAppState: StateType {
    var gameState: GameState?
    var musicState: MusicState?
}

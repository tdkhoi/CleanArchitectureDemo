//
//  GameState.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift
struct GameState: StateType {
    @VariableReplay(wrappedValue: nil) var currentGame: String?
}

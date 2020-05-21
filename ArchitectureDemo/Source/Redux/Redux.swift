//
//  Redux.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/21/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import ReSwift



var store: Store<MainAppState> = Store<MainAppState>.init(reducer: mainAppReducer, state: nil)


//
//  Animator.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import UIKit

protocol Animator: UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool { get set }
}

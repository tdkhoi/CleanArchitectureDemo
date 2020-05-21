//
//  Transition.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import UIKit

protocol Transition: class {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}

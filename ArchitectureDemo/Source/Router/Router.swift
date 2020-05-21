//
//  Router.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/20/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import UIKit

protocol Closable: class {
    func close()
}


protocol RouterProtocol: class {
    associatedtype V: UIViewController
    var viewController: V? { get }
    
    func open(_ viewController: UIViewController, transition: Transition)
}


class Router<U>: RouterProtocol, Closable where U: UIViewController {
    typealias V = U
    
    weak var viewController: V?
    var openTransition: Transition?

    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }

    func close() {
        guard let openTransition = openTransition else {
            assertionFailure("Open fail")
            return
        }
        guard let viewController = viewController else {
            assertionFailure("view controller nil")
            return
        }
        openTransition.close(viewController)
    }
    
    deinit {
        print("\(self) deinit")
    }
}

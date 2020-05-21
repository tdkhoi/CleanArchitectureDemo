//
//  BaseViewController.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/19/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

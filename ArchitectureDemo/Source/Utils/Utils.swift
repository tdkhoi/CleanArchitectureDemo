//
//  Utils.swift
//  ArchitectureDemo
//
//  Created by khoi tran on 5/19/20.
//  Copyright © 2020 khoi tran. All rights reserved.
//

import Foundation
import UIKit



infix operator >>>: Display
precedencegroup Display {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: AdditionPrecedence
}

@discardableResult
func >>> <E: AnyObject>(lhs: E, block: (E) -> Void) -> E {
    block(lhs)
    return lhs
}

@discardableResult
func >>> <E: AnyObject>(lhs: E?, block: (E?) -> Void) -> E? {
    block(lhs)
    return lhs
}

func >>> <E, F>(lhs: E, rhs: F) -> E where E: UIView, F: UIView {
    rhs.addSubview(lhs)
    return lhs
}

func >>> <E, F>(lhs: E, rhs: F?) -> E where E: UIView, F: UIView {
    rhs?.addSubview(lhs)
    return lhs
}


protocol LoadXibProtocol {}
extension LoadXibProtocol where Self:UIView {
    static func loadXib() -> Self {
        let bundle = Bundle(for: self)
        let name = "\(self)"
        guard let view = bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? Self else {
            fatalError("error xib \(name)")
        }
        return view
    }
}

extension LoadXibProtocol where Self: UIViewController {
    static func loadXib() -> Self {
        return Self(nibName: Self.identifier, bundle: nil)
    }
}

protocol Identifier {
    
    // Static vartiable to get id of object
    static var identifier: String {get}
}

//
// MARK: - Exntension
extension Identifier {
    
    static var identifier: String {
        return String(describing: self)
    }
}

//
// MARK: - Conform automatically
extension UIViewController: Identifier {}
extension UIView: Identifier {}


public protocol Cell {
    static var nib: UINib { get }
}



extension UICollectionViewCell: Cell {
    public static var nib: UINib {
        return loadNib()
    }
}

public extension Cell where Self: UICollectionViewCell {
    /// Load nib from bundle.
    ///
    /// - Parameter bundle: a bundle which contains cell's xib.
    static func loadNib(_ fromBundle: Bundle? = nil) -> UINib {
        let b = fromBundle ?? Bundle.main

        guard b.path(forResource: identifier, ofType: "nib") != nil else {
            fatalError("Could not load nib: \(identifier) from bundle: \(b.bundleURL.lastPathComponent).")
        }
        return UINib(nibName: identifier, bundle: b)
    }

    static func dequeueCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! Self
    }
}

extension UITableViewCell: Cell {
    public static var nib: UINib {
        return loadNib()
    }
}

public extension Cell where Self: UITableViewCell {
    
    static func loadNib(_ fromBundle: Bundle? = nil) -> UINib {
        let b = fromBundle ?? Bundle.main

        guard b.path(forResource: identifier, ofType: "nib") != nil else {
            fatalError("Could not load nib: \(identifier) from bundle: \(b.bundleURL.lastPathComponent).")
        }
        return UINib(nibName: identifier, bundle: b)
    }

    
    static func dequeueCell(_ tableView: UITableView) -> Self {
        return tableView.dequeueReusableCell(withIdentifier: identifier) as! Self
    }
}


protocol SafeAccessProtocol {
    var lock: NSRecursiveLock { get }
}

extension SafeAccessProtocol {
    @discardableResult
    func excute<T>(block: () -> T) -> T {
        lock.lock()
        defer { lock.unlock() }
        return block()
    }
}

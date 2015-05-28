//
//  OPLanguageExtensions.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/28/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import Foundation

infix operator &= { associativity left precedence 130 }
public func &=<T: AnyObject> (object: T, block: (object: T) -> ()) -> T {
    block(object: object)
    return object
}

//
//  OPEdgeInsetExtensions.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import Foundation

public func ==(lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> Bool {
    return UIEdgeInsetsEqualToEdgeInsets(lhs, rhs)
}

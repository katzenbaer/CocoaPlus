//
//  OPColorComponents.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

public class OPColorComponents: Equatable {
    public var red: CGFloat = 0.0
    public var green: CGFloat = 0.0
    public var blue: CGFloat = 0.0
    public var alpha: CGFloat = 0.0
    
    public init?(color: UIColor) {
        if !color.getRed(&self.red, green: &self.green, blue: &self.blue, alpha: &self.alpha) {
            return nil
        }
    }
}

public func ==(lhs: OPColorComponents, rhs: OPColorComponents) -> Bool {
    if lhs.red != rhs.red {
        return false
    } else if lhs.green != rhs.green {
        return false
    } else if lhs.blue != rhs.blue {
        return false
    } else if lhs.alpha != rhs.alpha {
        return false
    } else {
        return true
    }
}

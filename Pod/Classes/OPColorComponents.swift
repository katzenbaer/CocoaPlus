//
//  OPColorComponents.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import UIKit

public class OPColorComponents: Equatable {
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 0.0
    
    class func componentsOfColor(color: UIColor) -> OPColorComponents {
        let components = OPColorComponents()
        
        color.getRed(&components.red, green: &components.green, blue: &components.blue, alpha: &components.alpha)
        
        return components
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

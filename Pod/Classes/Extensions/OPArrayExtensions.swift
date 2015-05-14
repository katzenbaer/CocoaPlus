//
//  OPArrayExtensions.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import Foundation

/// **THIS CURRENTLY DOESN'T WORK SINCE SWIFT CAN'T HAVE PUBLIC EXTENSIONS**
extension Array {
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in enumerate(self) {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if index != nil {
            self.removeAtIndex(index!)
        }
    }
}

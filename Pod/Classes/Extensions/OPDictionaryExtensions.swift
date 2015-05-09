//
//  OPDictionaryExtensions.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import Foundation

extension Dictionary {
//    mutating func removeFirstObject<K, V: Equatable>(object: V) {
//        removeObject(object, limit: 1)
//    }
//    
//    mutating func removeObject<K, V: Equatable>(object: V) {
//        removeObject(object, limit: nil)
//    }
    
    internal mutating func removeObject<K, V: Equatable>(object: V, limit: Int?) {
        var counter = 0
        for (objectKey, objectToCompare) in self {
            if let to = objectToCompare as? V {
                if object == to {
                    if let key = objectKey as? K {
                        if let limit = limit {
                            if counter++ < limit {
                                self.removeValueForKey(key as! Key)
                            }
                        } else {
                            self.removeValueForKey(key as! Key)
                        }
                    }
                }
            }
        }
    }
}

//
//  OPUtilities.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import Foundation

public func oprint<T>(message: T, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
    _olog(print, file, function, line, message)
}

public func oprintln<T>(message: T, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
    _olog(println, file, function, line, message)
}

public func ofatalError<T>(message: T, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
    _olog({
        string in
        fatalError(string)
    }, file, function, line, message)
}

private func _olog<T>(f: (String) -> (), file: String, fcn: String, line: Int, msg: T) {
    f("\(file.lastPathComponent): \(fcn)@\(line): \(msg)")
}

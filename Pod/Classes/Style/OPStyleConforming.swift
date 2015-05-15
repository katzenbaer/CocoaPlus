//
//  OPStyleConforming.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import Foundation

public enum OPStyle: String {
    case Default = ""
    case Normal = "Normal"
    case Inverse = "Inverse"
    case Primary = "Primary"
}

public protocol OPStyleConforming {
    var styleIdentifier: String { get set }
    var style: OPStyle { get set }
    func didSetStyle(style: OPStyle) -> Void
}

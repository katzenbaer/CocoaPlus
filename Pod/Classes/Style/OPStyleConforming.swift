//
//  OPStyleConforming.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import Foundation

enum OPStyle: String {
    case Default = ""
    case Normal = "Normal"
    case Inverse = "Inverse"
    case Primary = "Primary"
}

protocol OPStyleConforming {
    var styleIdentifier: String { get set }
    var style: OPStyle { get set }
    func didSetStyle(style: OPStyle) -> Void
}

//
//  OPStyleConformingButton.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import UIKit

class OPStyleConformingButton: UIButton, OPStyleConforming {
    var style: OPStyle = .Default {
        didSet {
            didSetStyle(self.style)
        }
    }
    @IBInspectable var styleIdentifier: String {
        get {
            return style.rawValue
        }
        set(value) {
            if let style = OPStyle(rawValue: value) {
                self.style = style
            } else {
                ofatalError("'\(value)' is not a valid style.")
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.style == .Default {
            self.style = .Normal
        }
    }
    
    func didSetStyle(style: OPStyle) {
        let style = OPStyleClass.Button(style)
        self.backgroundColor = style.backgroundColor
        self.contentEdgeInsets = style.contentEdgeInsets
        self.imageView!.tintColor = style.ImageView.tintColor
        self.setTitleColor(style.titleColor, forState: .Normal)
    }
}

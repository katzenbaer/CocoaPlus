//
//  OPStyleConformingButton.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import UIKit

public class OPStyleConformingButton: UIButton, OPStyleConforming {
    public var style: OPStyle = .Default {
        didSet {
            didSetStyle(self.style)
        }
    }
    @IBInspectable public var styleIdentifier: String {
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
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if self.style == .Default {
            self.style = .Normal
        }
    }
    
    public func didSetStyle(style: OPStyle) {
        let style = OPStyleClass.Button(style)
        self.backgroundColor = style.backgroundColor
        self.contentEdgeInsets = style.contentEdgeInsets
        self.imageView!.tintColor = style.ImageView.tintColor
        self.setTitleColor(style.titleColor, forState: .Normal)
    }
}

//
//  OPRoundButton.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/14/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

@IBDesignable
public class OPRoundButton: OPStyleConformingButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    override public func didSetStyle(style: OPStyle) {
        super.didSetStyle(style)
        
        let buttonStyle = OPStyleSheet.ButtonWithStyle(style)
        self.cornerRadius = buttonStyle.cornerRadius
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        // Done here so it appears in both Interface Builder and at runtime.
        self.clipsToBounds = true
    }
}

//
//  OPRoundButton.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/14/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

/// :note: Corner Radius is equal to ``frame.size.height / 2.0``.
@IBDesignable
public class OPRoundButton: OPStyleConformingButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layoutSubviews()
        }
    }
    
    public override func didSetStyle(style: OPStyle) {
        super.didSetStyle(style)
        
        let buttonStyle = OPStyleSheet.ButtonWithStyle(style)
        self.cornerRadius = buttonStyle.cornerRadius
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        // Done here so it appears in both Interface Builder and at runtime.
        if !self.clipsToBounds {
            self.clipsToBounds = true
        }
        
        self.layer.cornerRadius = self.cornerRadius
    }
}

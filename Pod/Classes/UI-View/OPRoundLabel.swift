//
//  OPRoundLabel.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/14/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

@IBDesignable
public class OPRoundLabel: OPStyleConformingLabel {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    public override func didSetStyle(style: OPStyle) {
        super.didSetStyle(style)
        
        let tagStyle = OPStyleSheet.LabelWithStyle(style)
        self.cornerRadius = tagStyle.cornerRadius
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        // Done here so it appears in both Interface Builder and at runtime.
        self.clipsToBounds = true
    }
}

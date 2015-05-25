//
//  OPCircleButton.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

/// :note: Corner Radius is equal to ``frame.size.height / 2.0``.
@IBDesignable
public class OPCircleButton: OPRoundButton {
    override var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            // override to do nothing
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()

        self.layer.cornerRadius = self.frame.size.height / 2.0
    }
}

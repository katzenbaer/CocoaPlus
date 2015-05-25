//
//  OPCircleLabel.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/14/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

@IBDesignable
public class OPCircleLabel: OPRoundLabel {
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.cornerRadius = self.frame.size.height / 2.0
    }
}

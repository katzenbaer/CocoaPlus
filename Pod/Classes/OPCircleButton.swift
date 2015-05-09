//
//  OPCircleButton.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import UIKit

/// Height has precedence over width
@IBDesignable
class OPCircleButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        customInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        customInit()
    }
    
    private func customInit() {
        self.clipsToBounds = true
    }
    
    override func setImage(image: UIImage?, forState state: UIControlState) {
        super.setImage(image?.imageWithRenderingMode(.AlwaysTemplate), forState: state)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.size.height
    }
}

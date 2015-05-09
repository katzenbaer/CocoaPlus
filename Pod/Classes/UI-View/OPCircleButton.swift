//
//  OPCircleButton.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import UIKit

/// :note: Corner Radius is equal to ``frame.size.height / 2.0``.
@IBDesignable
class OPCircleButton: OPStyleConformingButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layoutSubviews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Since Interface Builder initializes this instance using a decoder, it essentially bypasses
        // the ``setImage:forState:`` function, so this is a hack is to rectify the image's
        // ``renderingMode``.
        if let image = self.imageView!.image {
            let templateImage = image.imageWithRenderingMode(.AlwaysTemplate)
            for state: UIControlState in [.Normal] { // Maybe other states?
                setImage(templateImage, forState: state)
            }
        }
    }
    
    override func setImage(image: UIImage?, forState state: UIControlState) {
        super.setImage(image?.imageWithRenderingMode(.AlwaysTemplate), forState: state)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Done here so it appears in both Interface Builder and at runtime.
        if !self.clipsToBounds {
            self.clipsToBounds = true
        }
        
        if self.cornerRadius != 0 {
            self.layer.cornerRadius = self.cornerRadius
        } else {
            self.layer.cornerRadius = self.frame.size.height / 2.0
        }
    }
    
}

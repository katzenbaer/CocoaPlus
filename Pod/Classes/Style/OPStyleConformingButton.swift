//
//  OPStyleConformingButton.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

public class OPStyleConformingButton: UIButton, OPStyleConforming {
    public override var highlighted: Bool {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    public var style: OPStyle = .Normal {
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

    @IBInspectable public var adjustsTitleFontSizeToFitWidth: Bool = false {
        didSet {
            self.titleLabel!.adjustsFontSizeToFitWidth = adjustsTitleFontSizeToFitWidth
            
            if (adjustsTitleFontSizeToFitWidth) {
                let currentFont = self.titleLabel!.font
                self.titleLabel!.font = currentFont.fontWithSize(self.frame.size.width)
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        didSetStyle(self.style)
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        didSetStyle(self.style)
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
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        didSetStyle(self.style)
    }
    
    public override func setImage(image: UIImage?, forState state: UIControlState) {
        super.setImage(image?.imageWithRenderingMode(.AlwaysTemplate), forState: state)
    }
    
    public override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        if self.highlighted {
            let context = UIGraphicsGetCurrentContext()
            CGContextSetRGBFillColor(context, 0, 0, 0, 0.4)
            CGContextFillRect(context, self.bounds)
        }
    }
    
    internal func didSetStyle(style: OPStyle) {
        let style = OPStyleSheet.ButtonWithStyle(style)
        self.backgroundColor = style.backgroundColor
        self.contentEdgeInsets = style.contentEdgeInsets
        self.imageView!.tintColor = style.ImageView.tintColor
        self.setTitleColor(style.titleColor(.Normal), forState: .Normal)
        self.setTitleColor(style.titleColor(.Highlighted), forState: .Highlighted)
    }
}

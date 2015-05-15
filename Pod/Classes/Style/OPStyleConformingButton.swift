//
//  OPStyleConformingButton.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
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
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init(coder aDecoder: NSCoder) {
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
    
    public func didSetStyle(style: OPStyle) {
        let style = OPStyleSheet.ButtonWithStyle(style)
        self.backgroundColor = style.backgroundColor
        self.contentEdgeInsets = style.contentEdgeInsets
        self.imageView!.tintColor = style.ImageView.tintColor
        self.setTitleColor(style.titleColor(.Normal), forState: .Normal)
        self.setTitleColor(style.titleColor(.Highlighted), forState: .Highlighted)
    }
    
    public override func setImage(image: UIImage?, forState state: UIControlState) {
        super.setImage(image?.imageWithRenderingMode(.AlwaysTemplate), forState: state)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if self.style == .Default {
            self.style = .Normal
        }
    }
}

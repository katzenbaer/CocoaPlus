//
//  OPStyleConformingLabel.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/14/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

public class OPStyleConformingLabel: UILabel, OPStyleConforming {
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
    private var dirtyIntrinsicSize: Bool = true
    private var internalHeight: CGFloat = 0
    private var internalWidth: CGFloat = 0
    public override var text: String? {
        didSet {
            super.text = text
            
            self.dirtyIntrinsicSize = true
            self.layoutSubviews()
        }
    }
    @IBInspectable public var contentEdgeInsets: UIEdgeInsets = UIEdgeInsetsZero {
        didSet {
            if let text = self.text {
                self.text = text
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
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        didSetStyle(self.style)
    }
    
    internal func didSetStyle(style: OPStyle) {
        let style = OPStyleSheet.LabelWithStyle(style)
        self.backgroundColor = style.backgroundColor
        self.contentEdgeInsets = style.contentEdgeInsets
        self.textAlignment = style.textAlignment
        self.textColor = style.textColor
        
        self.dirtyIntrinsicSize = true
        self.layoutSubviews()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        if self.dirtyIntrinsicSize {
            self.dirtyIntrinsicSize = false
            self.recalculateContentSize()
        }
    }
    
    private func recalculateContentSize() {
        let tempLabel = UILabel()
        tempLabel.font = self.font
        tempLabel.text = self.text
        tempLabel.sizeToFit()
        let expectedRect = tempLabel.bounds
        
        let horizontalInset = (self.contentEdgeInsets.left + self.contentEdgeInsets.right) / 2.0
        let verticalInset = (self.contentEdgeInsets.top + self.contentEdgeInsets.bottom) / 2.0
        let frameWithMargins = CGRectInset(expectedRect, -horizontalInset, -verticalInset)
        self.internalWidth = frameWithMargins.width
        self.internalHeight = frameWithMargins.height
        invalidateIntrinsicContentSize()
    }
    
    public override func intrinsicContentSize() -> CGSize {
        return CGSize(width: self.internalWidth, height: self.internalHeight)
    }
}

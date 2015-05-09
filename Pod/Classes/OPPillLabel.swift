//
//  OPPillLabel.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import UIKit

@IBDesignable
class OPPillLabel: UILabel {
    
    @IBInspectable var cornerRadius: CGFloat = 4 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    private var internalHeight: CGFloat = 0
    private var internalWidth: CGFloat = 0
    
    override var text: String? {
        didSet {
            super.text = text
            
            let tempLabel = UILabel()
            tempLabel.font = self.font
            tempLabel.text = self.text
            tempLabel.sizeToFit()
            let expectedRect = tempLabel.bounds
            
            let labelMargin: CGFloat = 4.0
            let frameWithMargins = CGRectInset(expectedRect, -labelMargin, -labelMargin)
            internalWidth = frameWithMargins.width
            internalHeight = frameWithMargins.height
            
            self.frame.size = CGSize(width: internalWidth, height: internalHeight)
            
            invalidateIntrinsicContentSize()
        }
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
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
        self.textAlignment = .Center
        
        // hack to invoke the didSet
        let cornerRadius = self.cornerRadius
        self.cornerRadius = cornerRadius
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: internalWidth, height: internalHeight)
    }
    
}

//
//  OPPillButton.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import UIKit

@IBDesignable
class OPPillButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 4 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
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
        self.titleLabel!.textAlignment = .Center
        
        // hack to invoke the didSet
        let cornerRadius = self.cornerRadius
        self.cornerRadius = cornerRadius
    }
    
    private var internalHeight: CGFloat = 0
    private var internalWidth: CGFloat = 0
    override func setTitle(title: String?, forState state: UIControlState) {
        super.setTitle(title, forState: state)
        
        let tempLabel = UILabel()
        tempLabel.font = self.titleLabel!.font
        tempLabel.text = title
        tempLabel.sizeToFit()
        let expectedRect = tempLabel.bounds
        
        let labelMargin: CGFloat = 4.0
        let frameWithMargins = CGRectInset(expectedRect, -labelMargin, -labelMargin)
        internalWidth = frameWithMargins.width
        internalHeight = frameWithMargins.height
        
        invalidateIntrinsicContentSize()
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: internalWidth, height: internalHeight)
    }
    
}


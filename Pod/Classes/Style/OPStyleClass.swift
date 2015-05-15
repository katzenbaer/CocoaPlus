//
//  OPStyleClass.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

public class OPStyleSheet {
    
    // MARK: - Buttons
    public class func ButtonWithStyle(style: OPStyle) -> Button.Normal.Type {
        switch style {
        case .Normal, .Default:
            return Button.Normal.self
        case .Primary:
            return Button.Primary.self
        case .Inverse:
            return Button.Inverse.self
        }
    }
    public class Button {
        public class Normal {
            public class var backgroundColor: UIColor {
                return UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.73)
            }
            public class var cornerRadius: CGFloat {
                return 4.0
            }
            public class func titleColor(state: UIControlState) -> UIColor {
                if state == .Highlighted {
                    return UIColor.grayColor()
                } else {
                    return UIColor.blackColor()
                }
            }
            public class var contentEdgeInsets: UIEdgeInsets {
                return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            }
            public class var ImageView: OPStyleSheet.ImageView.Normal.Type {
                class _ImageView: OPStyleSheet.ImageView.Normal { // internal
                    override class var tintColor: UIColor {
                        return UIColor.blackColor()
                    }
                }   
                return _ImageView.self
            }
        }
        public class Primary: Normal {
            public override class var backgroundColor: UIColor {
                return UIColor(red: 38.0/255.0, green: 129.0/255.0, blue: 220.0/255.0, alpha: 1.0)
            }
            public override class func titleColor(state: UIControlState) -> UIColor {
                if state == .Highlighted {
                    return UIColor.grayColor()
                } else {
                    return UIColor.whiteColor()
                }
            }
            public override class var ImageView: OPStyleSheet.ImageView.Normal.Type {
                class _ImageView: OPStyleSheet.ImageView.Normal { // internal
                    override class var tintColor: UIColor {
                        return UIColor.whiteColor()
                    }
                }
                return _ImageView.self
            }
        }
        public class Inverse: Primary {
            override public class var backgroundColor: UIColor {
                return UIColor(white: 0, alpha: 0.73)
            }
        }
    }
    
    // MARK: - Label
    public class func LabelWithStyle(style: OPStyle) -> Label.Normal.Type {
        switch style {
        case .Normal, .Default:
            return Label.Normal.self
        case .Primary:
            return Label.Primary.self
        case .Inverse:
            return Label.Inverse.self
        }
    }
    public class Label {
        public class Normal {
            public class var backgroundColor: UIColor {
                return UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.73)
            }
            public class var cornerRadius: CGFloat {
                return 4.0
            }
            public class var textAlignment: NSTextAlignment {
                return .Center
            }
            public class var textColor: UIColor {
                return UIColor.blackColor()
            }
            public class var contentEdgeInsets: UIEdgeInsets {
                return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            }
        }
        public class Primary: Normal {
            override public class var backgroundColor: UIColor {
                return UIColor(red: 38.0/255.0, green: 129.0/255.0, blue: 220.0/255.0, alpha: 1.0)
            }
            override public class var textColor: UIColor {
                return UIColor.whiteColor()
            }
        }
        public class Inverse: Primary {
            override public class var backgroundColor: UIColor {
                return UIColor(white: 0, alpha: 0.73)
            }
        }
    }
    
    // MARK: - ImageView
    public class ImageView {
        public class Normal {
            public class var tintColor: UIColor {
                return UIColor.clearColor()
            }
        }
    }
    
}

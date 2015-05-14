//
//  OPStyleClass.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import Foundation

public class OPStyleClass {
    
    // MARK: - Buttons
    public class func Button(style: OPStyle) -> ButtonStyle.Normal.Type {
        switch style {
        case .Normal, .Default:
            return ButtonStyle.Normal.self
        case .Primary:
            return ButtonStyle.Primary.self
        case .Inverse:
            return ButtonStyle.Inverse.self
        }
    }
    public class ButtonStyle {
        public class Normal {
            public class var backgroundColor: UIColor {
                return UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.73)
            }
            public class var titleColor: UIColor {
                return UIColor.blackColor()
            }
            public class var contentEdgeInsets: UIEdgeInsets {
                return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            }
            public class var ImageView: ImageViewStyle.Normal.Type {
                class _ImageView: ImageViewStyle.Normal { // internal
                    override class var tintColor: UIColor {
                        return UIColor.blackColor()
                    }
                }   
                return _ImageView.self
            }
        }
        public class Primary: Normal {
            override public class var backgroundColor: UIColor {
                return UIColor(red: 38.0/255.0, green: 129.0/255.0, blue: 220.0/255.0, alpha: 1.0)
            }
            override public class var titleColor: UIColor {
                return UIColor.whiteColor()
            }
            override public class var ImageView: ImageViewStyle.Normal.Type {
                class _ImageView: ImageViewStyle.Normal { // internal
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
    
    // MARK: - ImageView
    public class ImageViewStyle {
        public class Normal {
            public class var tintColor: UIColor {
                return UIColor.clearColor()
            }
        }
    }
    
}

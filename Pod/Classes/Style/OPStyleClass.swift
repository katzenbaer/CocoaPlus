//
//  OPStyleClass.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import Foundation

class OPStyleClass {
    
    // MARK: - Buttons
    class func Button(style: OPStyle) -> ButtonStyle.Normal.Type {
        switch style {
        case .Normal, .Default:
            return ButtonStyle.Normal.self
        case .Primary:
            return ButtonStyle.Primary.self
        case .Inverse:
            return ButtonStyle.Inverse.self
        }
    }
    class ButtonStyle {
        class Normal {
            class var backgroundColor: UIColor {
                return UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.73)
            }
            class var titleColor: UIColor {
                return UIColor.blackColor()
            }
            class var contentEdgeInsets: UIEdgeInsets {
                return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            }
            class var ImageView: ImageViewStyle.Normal.Type {
                class _ImageView: ImageViewStyle.Normal { // internal
                    override class var tintColor: UIColor {
                        return UIColor.blackColor()
                    }
                }   
                return _ImageView.self
            }
        }
        class Primary: Normal {
            override class var backgroundColor: UIColor {
                return UIColor(red: 38.0/255.0, green: 129.0/255.0, blue: 220.0/255.0, alpha: 1.0)
            }
            override class var titleColor: UIColor {
                return UIColor.whiteColor()
            }
            override class var ImageView: ImageViewStyle.Normal.Type {
                class _ImageView: ImageViewStyle.Normal { // internal
                    override class var tintColor: UIColor {
                        return UIColor.whiteColor()
                    }
                }
                return _ImageView.self
            }
        }
        class Inverse: Primary {
            override class var backgroundColor: UIColor {
                return UIColor(white: 0, alpha: 0.73)
            }
        }
    }
    
    // MARK: - ImageView
    class ImageViewStyle {
        class Normal {
            class var tintColor: UIColor {
                return UIColor.clearColor()
            }
        }
    }
    
}

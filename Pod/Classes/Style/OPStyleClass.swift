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
    /// Buttons
    class func Button(style: OPStyle) -> ButtonNormal.Type {
        switch style {
        case .Primary:
            return ButtonPrimary.self
        case .Inverse:
            return ButtonInverse.self
        default:
            return ButtonPrimary.self
        }
    }
    class ButtonNormal {
        class var backgroundColor: UIColor {
            return UIColor(red: 38.0/255.0, green: 129.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        }
        static let contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        class ImageView {
            static let tintColor = UIColor.whiteColor()
        }
    }
    class ButtonPrimary: ButtonNormal {
        
    }
    class ButtonInverse: ButtonNormal {
        override class var backgroundColor: UIColor {
            return UIColor(white: 0, alpha: 0.73)
        }
    }
    
}

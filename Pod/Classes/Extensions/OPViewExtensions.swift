//
//  OPViewExtensions.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

/// **THIS CURRENTLY DOESN'T WORK SINCE SWIFT CAN'T HAVE PUBLIC EXTENSIONS**
extension UIView {
    func rasterize() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.mainScreen().scale)
        
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext();
        return image;
    }
}

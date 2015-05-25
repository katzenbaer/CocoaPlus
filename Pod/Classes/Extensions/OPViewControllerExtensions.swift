//
//  OPViewControllerExtensions.swift
//  CocoaPlus
//
//  Created by Terrence Katzenbaer on 5/9/15.
//  Copyright (c) 2015 Terrence Katzenbaer (@tkatzenbaer). All rights reserved.
//

import UIKit

/// **THIS CURRENTLY DOESN'T WORK SINCE SWIFT CAN'T HAVE PUBLIC EXTENSIONS**
extension UIViewController {
    enum UIViewControllerEmbedType {
        case NavigationController
        //        case TabBarController
    }
    
    func embed(type: UIViewControllerEmbedType) -> UIViewController {
        switch type {
        case .NavigationController:
            return UINavigationController(rootViewController: self)
        }
    }
}

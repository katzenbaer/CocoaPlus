//
//  OPViewControllerExtensions.swift
//  Pods
//
//  Created by Terrence Katzenbaer on 5/9/15.
//
//

import UIKit

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

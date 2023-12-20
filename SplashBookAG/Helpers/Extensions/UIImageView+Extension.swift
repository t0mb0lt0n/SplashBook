//
//  UIImageView+Extension.swift
//  SplashBookAG
//
//  Created by Alexander on 18.12.2023.
//

import Foundation
import UIKit

extension UIImageView {
    static var urlKey = 0
    static var taskKey = 0
    
    private var currentURL: URL? {
        get {
            objc_getAssociatedObject(
                self,
                &UIImageView.urlKey
            ) as? URL
        }
        
        set {
            objc_setAssociatedObject(
                self,
                &UIImageView.urlKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
}

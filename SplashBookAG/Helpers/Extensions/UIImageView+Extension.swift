//
//  UIImageView+Extension.swift
//  SplashBookAG
//
//  Created by Alexander on 18.12.2023.
//

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
    
    private var currentTask: URLSessionTask? {
        get {
            objc_getAssociatedObject(
                self,
                &UIImageView.taskKey
            ) as? URLSessionTask
        }
        
        set {
            objc_setAssociatedObject(
                self,
                &UIImageView.taskKey,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    final func loadImageAsync(from urlString: String?) {
        currentTask?.cancel()
        currentTask = nil
        
        guard let urlString = urlString else { return }
        if let cachedImage = ImageCache.shared.image(forKey: urlString) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        currentURL = url
    }
}

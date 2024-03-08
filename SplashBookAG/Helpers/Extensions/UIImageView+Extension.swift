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
    
    final func loadImageAsync(
        from urlString: String?,
        completion: @escaping (Bool) -> Void?
    ) {
        currentTask?.cancel()
        currentTask = nil
        
        guard let urlString = urlString else { return }
        if let cachedImage = ImageCache.shared.image(forKey: urlString) {
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        currentURL = url
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            self?.currentTask = nil
            if let error = error {
                //error handle needed
                print(error.localizedDescription)
                return
            }
            
            guard let data = data, let downloadedImage = UIImage(data: data) else { return }
            ImageCache.shared.save(image: downloadedImage, forKey: urlString)
            
            if url == self?.currentURL {
                DispatchQueue.main.async {
                    print("Image downloaded")
                    self?.image = downloadedImage
                }
                completion(true)
            }
        }
        currentTask = task
        task.resume()
    }
}
            
            
            

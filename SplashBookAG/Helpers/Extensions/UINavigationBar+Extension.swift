//
//  UINavigationBar+Extension.swift
//  SplashBookAG
//
//  Created by Alexander on 12.12.2023.
//

import Foundation
import UIKit

extension UINavigationBar {
    func changeNavigationBarStyle() {
        self.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30),
            NSAttributedString.Key.foregroundColor: UIColor.systemOrange
        ]
    }
}

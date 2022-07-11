//
//  UIVIewControllerExtention.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 06.07.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func showToast(message: String){
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.width/2-75, y: self.view.frame.height - 100, width: 150, height: 40))
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor.lightGray.withAlphaComponent(1)
        toastLabel.textColor = .white
        toastLabel.alpha = 1
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        toastLabel.text = message
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 2, delay: 0.5, options: .curveEaseOut) {
            toastLabel.alpha = 0
        } completion: { isCompleted in
            toastLabel.removeFromSuperview()
        }

        
    }
}

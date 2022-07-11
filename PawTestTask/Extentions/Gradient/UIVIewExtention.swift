//
//  UIVIewExtention.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 11.07.2022.
//

import Foundation
import UIKit

extension UIView {

    func layerGradient(startPoint:CAGradientPoint, endPoint:CAGradientPoint ,colorArray:[CGColor], type:CAGradientLayerType ) {
        let gradient = CAGradientLayer(start: .topLeft, end: .bottomRight, colors: colorArray, type: type)
        gradient.frame.size = self.frame.size
        self.layer.insertSublayer(gradient, at: 0)
    }
}

//
//  GradientExtention.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 11.07.2022.
//

import Foundation
import UIKit

extension CAGradientLayer {

    convenience init(start: CAGradientPoint, end: CAGradientPoint, colors: [CGColor], type: CAGradientLayerType) {
        self.init()
        self.frame.origin = CGPoint.zero
        self.startPoint = start.point
        self.endPoint = end.point
        self.colors = colors
        self.locations = (0..<colors.count).map(NSNumber.init)
        self.type = type
    }
}

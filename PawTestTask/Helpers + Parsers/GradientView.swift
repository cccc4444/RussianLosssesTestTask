//
//  GradientView.swift
//  PawTestTask
//
//  Created by Danylo Kushlianskyi on 11.07.2022.
//

import UIKit

class GradientView: UIView {
    override open class var layerClass: AnyClass {
           return CAGradientLayer.classForCoder()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.layerGradient(startPoint: .topRight, endPoint: .bottomLeft, colorArray: [#colorLiteral(red: 0.2967155612, green: 0.819701318, blue: 0.3384534102, alpha: 1).cgColor, #colorLiteral(red: 0.02883184524, green: 0.4162946429, blue: 0.2716219901, alpha: 1).cgColor], type: .radial)
        }
}

class BackView: UIView {
    override open class var layerClass: AnyClass {
           return CAGradientLayer.classForCoder()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)

            self.layerGradient(startPoint: .center, endPoint: .bottomCenter, colorArray: [UIColor.systemGray5.cgColor, UIColor.systemGray6.cgColor], type: .radial)
        }
}

class CellView: UIView {
    override open class var layerClass: AnyClass {
           return CAGradientLayer.classForCoder()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.layer.cornerRadius = 20
            self.layer.masksToBounds = true
            self.layerGradient(startPoint: .topLeft, endPoint: .bottomRight, colorArray: [UIColor.white.cgColor, UIColor.white.cgColor], type: .radial)
        }
}

enum CAGradientPoint {
    case topLeft
    case centerLeft
    case bottomLeft
    case topCenter
    case center
    case bottomCenter
    case topRight
    case centerRight
    case bottomRight
    var point: CGPoint {
        switch self {
        case .topLeft:
            return CGPoint(x: 0, y: 0)
        case .centerLeft:
            return CGPoint(x: 0, y: 0.5)
        case .bottomLeft:
            return CGPoint(x: 0, y: 1.0)
        case .topCenter:
            return CGPoint(x: 0.5, y: 0)
        case .center:
            return CGPoint(x: 0.5, y: 0.5)
        case .bottomCenter:
            return CGPoint(x: 0.5, y: 1.0)
        case .topRight:
            return CGPoint(x: 1.0, y: 0.0)
        case .centerRight:
            return CGPoint(x: 1.0, y: 0.5)
        case .bottomRight:
            return CGPoint(x: 1.0, y: 1.0)
        }
    }
}





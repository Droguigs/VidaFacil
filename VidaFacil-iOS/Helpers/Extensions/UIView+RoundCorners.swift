//
//  UIView+RoundCorners.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 13/08/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit

extension UIView {
    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

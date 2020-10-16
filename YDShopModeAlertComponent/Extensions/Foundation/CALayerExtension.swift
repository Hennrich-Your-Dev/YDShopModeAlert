//
//  CALayerExtension.swift
//  YDShopModeAlertComponent
//
//  Created by Douglas Hennrich on 15/10/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit

extension CALayer {

	func applyShadow(
		color: UIColor = .black,
		alpha: Float = 0.4,
		x: CGFloat = 0,
		y: CGFloat = 4,
		blur: CGFloat = 7,
		spread: CGFloat = 0
	) {

		shadowColor = color.cgColor
		shadowOpacity = alpha
		shadowOffset = CGSize(width: x, height: y)
		shadowRadius = blur / 2.0

		if spread == 0 {
			shadowPath = nil
		} else {
			let dx = -spread
			let rect = bounds.insetBy(dx: dx, dy: dx)
			shadowPath = UIBezierPath(rect: rect).cgPath
		}
	}

}

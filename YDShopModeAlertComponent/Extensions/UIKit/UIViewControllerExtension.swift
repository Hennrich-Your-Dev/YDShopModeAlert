//
//  UIViewControllerExtension.swift
//  YDShopModeAlertComponent
//
//  Created by Douglas Hennrich on 15/10/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit

extension UIApplication {
	func topMostViewController() -> UIViewController? {
		return self.keyWindow?.rootViewController?.topMostViewController()
	}
}

extension UIViewController {
	func topMostViewController() -> UIViewController? {
		if self.presentedViewController == nil {
			return self
		}
		if let navigation = self.presentedViewController as? UINavigationController {
			return navigation.visibleViewController?.topMostViewController()
		}
		if let tab = self.presentedViewController as? UITabBarController {
			if let selectedTab = tab.selectedViewController {
				return selectedTab.topMostViewController()
			}
			return tab.topMostViewController()
		}
		return self.presentedViewController?.topMostViewController()
	}

	public class var identifier: String {
		return String(describing: self)
	}

	public class func initializeFromStoryboard() -> Self? {
		let bundle = Bundle.init(for: Self.self)
		let storyboard = UIStoryboard(
			name: NSStringFromClass(Self.self)
				.components(separatedBy: ".")
				.last!,
			bundle: bundle
		)

		return storyboard.instantiateViewController(withIdentifier: self.identifier) as? Self
	}
}

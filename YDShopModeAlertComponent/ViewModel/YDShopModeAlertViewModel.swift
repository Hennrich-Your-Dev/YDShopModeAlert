//
//  YDShopModeAlertViewModel.swift
//  YDShopModeAlertComponent
//
//  Created by Douglas Hennrich on 15/10/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit

// MARK: Navigation Delegate
protocol YDShopModeAlertNavigationDelegate: AnyObject {
	func exit()
	func showShopMode()
}

// MARK: View Model Delegate
protocol YDShopModeAlertViewModelDelegate: AnyObject {
	func letMeIn()
	func maybeLater()
}

// MARK: View Model
class YDShopModeAlertViewModel {

	// MARK: Properties
	var navigation: YDShopModeAlertNavigationDelegate?

	// MARK: Init
	init(navigation: YDShopModeAlertNavigationDelegate) {
		self.navigation = navigation
	}
}

// MARK: Extend
extension YDShopModeAlertViewModel: YDShopModeAlertViewModelDelegate {
	func letMeIn() {
		navigation?.showShopMode()
	}

	func maybeLater() {
		navigation?.exit()
	}
}

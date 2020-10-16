//
//  YDShopModeAlertCoordinator.swift
//  YDShopModeAlertComponent
//
//  Created by Douglas Hennrich on 15/10/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit

// Delegate
public protocol YDShopModeAlertDelegate {
	func onOpenHome()
}

public typealias YDShopModeAlert = YDShopModeAlertCoordinator

public class YDShopModeAlertCoordinator {

	// Properties
	var rootViewController: UIViewController {
		return self.navigationController
	}

	lazy var navigationController: UINavigationController = {
		let nav = UINavigationController()
		nav.isNavigationBarHidden = true
		nav.modalPresentationStyle = .overCurrentContext
		return nav
	}()

	var delegate: YDShopModeAlertDelegate?

	// MARK: Init
	public init(delegate: YDShopModeAlertDelegate) {
		self.delegate = delegate
	}

	// MARK: Actions
	public func start() {
		guard let viewController = YDShopModeAlertViewController.initializeFromStoryboard() else {
			fatalError("YDMHomeViewController.initializeFromStoryboard")
		}

		let topViewController = UIApplication.shared.keyWindow?
			.rootViewController?.topMostViewController()

		let viewModel = YDShopModeAlertViewModel(navigation: self)

		viewController.viewModel = viewModel

		navigationController.viewControllers = [viewController]
		topViewController?.present(navigationController, animated: true)
	}
}

extension YDShopModeAlertCoordinator: YDShopModeAlertNavigationDelegate {

	func exit() {
		rootViewController.dismiss(animated: true, completion: nil)
	}

	func showShopMode() {
		rootViewController.dismiss(animated: true, completion: { [weak self] in
			self?.delegate?.onOpenHome()
		})
	}
}

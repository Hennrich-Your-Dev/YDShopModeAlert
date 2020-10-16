//
//  YDShopModeAlertViewController.swift
//  YDShopModeAlertComponent
//
//  Created by Douglas Hennrich on 15/10/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit

class YDShopModeAlertViewController: UIViewController {

	// MARK: Properties
	var viewModel: YDShopModeAlertViewModelDelegate?

	// MARK: IBOutlets
	@IBOutlet var redContainer: UIView! {
		didSet {
			redContainer.layer.cornerRadius = 16
			redContainer.layer.applyShadow()
		}
	}
	@IBOutlet var letMeInButton: UIButton! {
		didSet {
			letMeInButton.layer.cornerRadius = 4
			letMeInButton.layer.borderWidth = 1.5
			letMeInButton.layer.borderColor = UIColor.white.cgColor
		}
	}

	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	// MARK: IBActions
	@IBAction func onLetMeIn(_ sender: UIButton) {
		viewModel?.letMeIn()
	}
	
	@IBAction func onMaybeLater(_ sender: Any) {
		viewModel?.maybeLater()
	}
}

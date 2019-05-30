//
//  LoginAnimationVC.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/30.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class LoginAnimationVC: UIViewController {

	@IBOutlet weak var usernameTextField: UITextField!
	
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var usernameCenterConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var passwordCenterConstraint: NSLayoutConstraint!
	@IBOutlet weak var LoginButton: UIButton!
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		usernameCenterConstraint.constant -= UIScreen.main.bounds.width
		passwordCenterConstraint.constant -= UIScreen.main.bounds.width
		LoginButton.alpha = 0
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		UIView.animate(withDuration: 0.5, delay: 0.00, options: .curveEaseOut, animations: {
			self.usernameCenterConstraint.constant += UIScreen.main.bounds.width
			self.view.layoutIfNeeded()
		}, completion: nil)
		
		UIView.animate(withDuration: 0.5, delay: 0.10, options: .curveEaseOut, animations: {
			self.passwordCenterConstraint.constant += UIScreen.main.bounds.width
			self.view.layoutIfNeeded()
		}, completion: nil)
		
		UIView.animate(withDuration: 0.5, delay: 0.20, options: .curveEaseOut, animations: {
			self.LoginButton.alpha = 1
		}, completion: nil)
	}


	@IBAction func LoginButtonClick(_ sender: UIButton) {
		let bounds = self.LoginButton.bounds
		
		UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveLinear, animations: {
			self.LoginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.width + 60, height: bounds.height)
		}) { (finish) in
			self.LoginButton.isEnabled = true
		}
	}
	
	@IBAction func buttonDragOutSide(_ sender: UIButton) {
//		let bounds = self.LoginButton.bounds
//		
//		UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveLinear, animations: {
//			self.LoginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.width + 60, height: bounds.height)
//		}) { (finish) in
//			self.LoginButton.isEnabled = true
//		}
		
	}
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		UIApplication.shared.keyWindow?.endEditing(true)
	}

}

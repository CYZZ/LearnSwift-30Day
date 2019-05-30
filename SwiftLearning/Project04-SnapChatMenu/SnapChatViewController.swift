//
//  SnapChatViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/25.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class SnapChatViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		let screenWidth = UIScreen.main.bounds.width
		let screenHeight = UIScreen.main.bounds.height
		let leftVC:LeftViewController = LeftViewController(nibName:"LeftViewController",bundle:nil)
		let centerVC: CameraVC = CameraVC(nibName:"CameraVC",bundle:nil)
		let rightVC: RightViewController = RightViewController(nibName:"RightViewController",bundle:nil)
		
		
		leftVC.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
		centerVC.view.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
		rightVC.view.frame = CGRect(x: 2 * screenWidth, y: 0, width: screenWidth, height: screenHeight)
		
		self.scrollView.addSubview(leftVC.view)
		self.scrollView.addSubview(centerVC.view)
		self.scrollView.addSubview(rightVC.view)
		
		self.scrollView.contentSize = CGSize(width: screenWidth * 3, height: screenHeight)
		
        // Do any additional setup after loading the view.
    }
	
	override var prefersStatusBarHidden: Bool {
		return true
	}

}

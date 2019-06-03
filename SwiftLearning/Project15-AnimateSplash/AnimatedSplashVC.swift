//
//  AnimatedSplashVC.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/31.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class AnimatedSplashVC: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	
	var mask: CALayer?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.mask = CALayer()
		self.mask?.contents = UIImage(named: "twitter")?.cgImage
		self.mask?.contentsGravity = .resizeAspect
		self.mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 80)
		self.mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//		self.imageView.setNeedsLayout()
//		self.imageView.layoutIfNeeded()
		self.mask?.position = CGPoint(x: self.imageView.frame.width / 2, y: self.imageView.frame.height / 2)
//		self.mask?.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
		self.imageView.layer.mask = mask
		
		self.animateMask()
    }
	
	func animateMask() -> Void {
		let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
		keyFrameAnimation.delegate = self
		keyFrameAnimation.duration = 1.0
		keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
		keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: .easeOut),
											 CAMediaTimingFunction(name: .easeOut),
											 CAMediaTimingFunction(name: .easeOut),
		 CAMediaTimingFunction(name: .easeOut),]
		do {
			// 动画需要加上这段代码，否则会造成闪烁一下
			keyFrameAnimation.fillMode = .forwards
			keyFrameAnimation.isRemovedOnCompletion = false
		}
//		let initalBounds = NSValue(cgRect: mask!.bounds)
//		let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 90 * 0.7, height: 73 * 0.7))
//		let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
//
//		keyFrameAnimation.values = [initalBounds, secondBounds, finalBounds]
//		keyFrameAnimation.keyTimes = [0,0.3,1]
		
		
		let initalBounds = NSValue(cgRect: mask!.bounds)
		let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 100 * 0.7, height: 80 * 0.7))
		let thirdBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 100 * 1.2, height: 80 * 1.2))
		let fouthBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 100 * 0.6, height: 80 * 0.6))
		let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 1600, height: 1300))
		
		keyFrameAnimation.values = [initalBounds, secondBounds,thirdBounds,fouthBounds, finalBounds]
		keyFrameAnimation.keyTimes = [0,0.3,0.5,0.7,1.0]
		
		
		
		self.mask?.add(keyFrameAnimation, forKey: "bounds")
		
	}

}



extension AnimatedSplashVC : CAAnimationDelegate {
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		self.imageView.layer.mask = nil
	}
}

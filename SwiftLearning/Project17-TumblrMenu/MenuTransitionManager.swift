//
//  MenuTransitionManager.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/6/3.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject {
	
	private var presenting = false
	
	func offstage(_ amount: CGFloat) -> CGAffineTransform {
		return CGAffineTransform(translationX: amount, y: 0)
	}
	
	func offStageMenuController(_ menuViewController: MenuViewController) -> Void {
		if !presenting {
			menuViewController.view.alpha = 0
		}
		let topRowOffset : CGFloat = 300
		let middleRowOffset : CGFloat = 150
		let bottomRowOffset : CGFloat = 50
		
		menuViewController.textButton.transform = self.offstage(-topRowOffset)
		
		menuViewController.quoteButton.transform = self.offstage(-middleRowOffset)
		
		menuViewController.chatButton.transform = self.offstage(-bottomRowOffset)
		
		menuViewController.photoButton.transform = self.offstage(topRowOffset)
		
		menuViewController.linkButton.transform = self.offstage(middleRowOffset)
		
		menuViewController.audioButton.transform = self.offstage(bottomRowOffset)
	}
	
	func onStatgeMenuController(_ menuViewController : MenuViewController) -> Void {
		
		menuViewController.view.alpha = 1
		
		menuViewController.textButton.transform = .identity
		
		menuViewController.quoteButton.transform = .identity
		
		menuViewController.chatButton.transform = .identity
		
		menuViewController.photoButton.transform = .identity
		
		menuViewController.linkButton.transform = .identity
		
		menuViewController.audioButton.transform = .identity
	}

}

extension MenuTransitionManager : UIViewControllerTransitioningDelegate {
	func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		self.presenting = true
		return self
	}
	
	func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		self.presenting = false
		return self
	}
}

extension MenuTransitionManager : UIViewControllerAnimatedTransitioning {
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
		return 0.5
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
		let container = transitionContext.containerView
		let screens: (from:UIViewController, to: UIViewController) = (transitionContext.viewController(forKey: .from)!,transitionContext.viewController(forKey: .to)!)
		
		let menuViewController = !self.presenting ? screens.from as! MenuViewController : screens.to as! MenuViewController
		let bottomViewController = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
		
		let menuView: UIView = menuViewController.view
		let bottomView: UIView = bottomViewController.view
		
		if self.presenting {
			self.offStageMenuController(menuViewController)
		}
		container.addSubview(bottomView)
		container.addSubview(menuView)
		
		let duration = self.transitionDuration(using: transitionContext)
		
		UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: {
			if self.presenting {
				self.onStatgeMenuController(menuViewController)
			} else {
				self.offStageMenuController(menuViewController)
			}
		}) { (finished) in
			transitionContext.completeTransition(true)
			UIApplication.shared.keyWindow?.addSubview(screens.to.view)
		}
		
	}
	
}

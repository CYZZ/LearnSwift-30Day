//
//  ImageScrollViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/28.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class ImageScrollViewController: UIViewController,UIScrollViewDelegate {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var imageView: UIImageView!
	
	@IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
	@IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
	@IBOutlet weak var imageViewRightConstraint: NSLayoutConstraint!
	@IBOutlet weak var imageViewleftConstraint: NSLayoutConstraint!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Do any additional setup after loading the view.
    }
	
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		
		updateMinZoomScaleForSize(view.bounds.size)
	}
	
	// 计算scrollView的缩放比例
	fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
		let widthScale = size.width / imageView.bounds.width
		let heightScale = size.height / imageView.bounds.height
		
		// 选取宽度和高度比例中最下ode那个，设置为minizoomscale
		let minScale  = min(widthScale, heightScale)
		
		scrollView.minimumZoomScale = minScale
		scrollView.maximumZoomScale = 3.0
		scrollView.zoomScale = minScale
	}
	
	func scrollViewDidZoom(_ scrollView: UIScrollView) {
//		updateMinZoomScaleForSize(view.bounds.size)
		updateConstraintsForSize(view.bounds.size)
	}
	
	func viewForZooming(in scrollView: UIScrollView) -> UIView? {
		return self.imageView
	}

	// 当scroll缩放的内容小于边界的时候会默认显示在左上角(0,0)的位置，
	fileprivate func updateConstraintsForSize(_ size: CGSize) {
		// 将图片居中
		let yOffset = max(0, (size.height - imageView.frame.height)/2)
		imageViewTopConstraint.constant = yOffset
		imageViewBottomConstraint.constant = yOffset
		
		// 根据宽度计算imageVIew的前后约束
		let xOffset = max(0, (size.width - imageView.frame.width)/2.0)
		imageViewleftConstraint.constant = xOffset
		imageViewRightConstraint.constant = xOffset
		
		view.layoutIfNeeded()
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

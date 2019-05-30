//
//  CarouselViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/25.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {
	@IBOutlet weak var backgroundImageView: UIImageView!
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	// 访问权限分类： private，fileprivate，internal，public和open
	// private:只能在奔雷的作用域且在当前文件内能访问
	// fileprivate：只能在当前文件内访问
	// internal:benmodule内能访问
	// public:跨module访问但不能重写或继承
	// open: 跨module访问并且能重写或继承
	fileprivate var interests = Interest.createInterests()
	
	override func viewDidLoad() {
        super.viewDidLoad()
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(UINib(nibName: "InterestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Storybord.CellIdentifier)
        // Do any additional setup after loading the view.
    }
	
	fileprivate struct Storybord {
		static let CellIdentifier = "InterestCell"
		static let CellPadding: CGFloat = 20.0
	}

}

extension CarouselViewController : UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return interests.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storybord.CellIdentifier, for: indexPath) as! InterestCollectionViewCell
		
		cell.inter = self.interests[indexPath.row]
		
		return cell
		
	}
}

extension CarouselViewController : UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: UIScreen.main.bounds.width - 2*Storybord.CellPadding, height: 500)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 2 * Storybord.CellPadding
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: Storybord.CellPadding, bottom: 0, right: Storybord.CellPadding)
	}
	
}

//extension CarouselViewController : UIScrollViewDelegate {
//	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//		let originPoint = targetContentOffset.pointee
//		var index = Int(originPoint.x / UIScreen.main.bounds.width)
//		let offset = Int(originPoint.x) % Int(UIScreen.main.bounds.width)
//		index += (offset > Int(UIScreen.main.bounds.width/2) ? 1 : 0)
//		targetContentOffset.pointee = CGPoint(x: index * Int(UIScreen.main.bounds.width), y: 0)
//	}
//}

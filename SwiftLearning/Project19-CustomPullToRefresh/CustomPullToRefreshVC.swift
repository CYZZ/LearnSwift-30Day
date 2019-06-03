//
//  CustomPullToRefreshVC.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/6/3.
//  Copyright © 2019年 chiyz. All rights reserved.//

import UIKit

class CustomPullToRefreshVC: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	var refreshController: UIRefreshControl!
	var customView : UIView!
	var labelsArr:Array<UILabel> = []
	var isAnimating = false
	var currentColorIndex = 0
	var currentLabelIndex = 0
	var timer: Timer!
	var dataArray: Array<String> = ["哈哈😄","微笑😊","笑尿🤣","蚂蚁🐜","困😴","且🐧","面包🍞","西瓜🍉"]
	
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

		refreshController = UIRefreshControl()
		refreshController.backgroundColor = UIColor.clear
		refreshController.tintColor = UIColor.clear
		tableView.addSubview(refreshController)
		
		tableView.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
		
		self.loadCustomRefreshContents()
        // Do any additional setup after loading the view.
    }

	func loadCustomRefreshContents() -> Void {
		
		let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)
		
		customView = refreshContents![0] as? UIView
		
		customView.frame = refreshController.bounds
		
		for i in 0..<customView.subviews.count {
			labelsArr.append(customView.viewWithTag(i + 1) as! UILabel)
		}
		refreshController.addSubview(customView)
	}
	
	func animateRefreshStep1() -> Void {
		isAnimating = true
		UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveLinear, animations: {
			self.labelsArr[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/4))
			self.labelsArr[self.currentLabelIndex].textColor = self.getNextColor()
		}) { (finished) in
			UIView.animate(withDuration: 0.05, delay: 0.0, options: .curveLinear, animations: {
				self.labelsArr[self.currentLabelIndex].transform = .identity
				self.labelsArr[self.currentLabelIndex].textColor = UIColor.black
			}, completion: { (comple) in
				self.currentLabelIndex += 1
				if self.currentLabelIndex < self.labelsArr.count {
					self.animateRefreshStep1()
				} else {
					self.animateRefreshStep2()
				}
			})
		}
	}
	
	func animateRefreshStep2() -> Void {
		UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveLinear, animations: {
			let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
			self.labelsArr[1].transform = scale
			self.labelsArr[2].transform = scale
			self.labelsArr[3].transform = scale
			self.labelsArr[4].transform = scale
		}) { (finished) in
			UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveLinear, animations: {
				self.labelsArr[0].transform = .identity
				self.labelsArr[1].transform = .identity
				self.labelsArr[2].transform = .identity
				self.labelsArr[3].transform = .identity
				self.labelsArr[4].transform = .identity
			}, completion: { (comple) in
				if self.refreshController.isRefreshing {
					self.currentLabelIndex = 0
					self.animateRefreshStep1()
				} else {
					self.isAnimating = false
					self.currentLabelIndex = 0
					for i in 0 ..< self.labelsArr.count {
						self.labelsArr[i].textColor = UIColor.black
						self.labelsArr[i].transform = .identity
					}
				}
			})
		}
	}
	
	
	func getNextColor() -> UIColor {
		var colorsArray:Array<UIColor> = [.magenta,.brown,.yellow,.red,.green,.blue,.orange]
		if self.currentColorIndex == colorsArray.count {
			currentColorIndex = 0
		}
		let returnColor = colorsArray[currentColorIndex]
		currentColorIndex += 1
		return returnColor
		
	}
	
	func doSomething() -> Void {
		timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(endedOfWork), userInfo: nil, repeats: true)
	}
	
	@objc func endedOfWork() {
		refreshController.endRefreshing()
		timer.invalidate()
		timer = nil
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

extension CustomPullToRefreshVC: UIScrollViewDelegate {
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		if refreshController.isRefreshing {
			if !isAnimating {
				doSomething()
				animateRefreshStep1()
			}
		}
	}
}

extension CustomPullToRefreshVC : UITableViewDataSource,UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

		cell.textLabel?.text = dataArray[indexPath.row]
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
}

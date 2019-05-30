//
//  PullRefreshViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/28.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class PullRefreshViewController: UIViewController {
	
	var tableView : UITableView!
	var index = 0
	let cellIdentifier = "helloCellIdentifier"
	let firstEmoji = ["hhh😄","woshishuij🤣🐥","yazi😯","wuya🐂🐅呀"]
	let seconEmoji = ["dabian鸵鸟","dier","7897890789","我不知道我是谁🛬🇬🇧🇺🇸🇨🇳"]
	
	var emojiData = [String]()
	var refreshControl = UIRefreshControl()
	
	

    override func viewDidLoad() {
        super.viewDidLoad()

		self.tableView = UITableView(frame: self.view.bounds, style: .plain)
		emojiData = firstEmoji
		
		tableView.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.2, alpha: 1)
		tableView.dataSource = self
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
		
		if #available(iOS 10.0, *) {
			tableView.refreshControl = self.refreshControl
		} else {
			// Fallback on earlier versions
			print("当前版本低于iOS 10tableView没有 refreshControl属性")
		}
		
		
		self.refreshControl.addTarget(self, action: #selector(didRoadEmoji), for: .valueChanged)
		
		
		self.view.addSubview(self.tableView)
		
		
        // Do any additional setup after loading the view.
    }
	
	@objc func didRoadEmoji() -> Void {
		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
			self.emojiData = [self.firstEmoji, self.seconEmoji][self.index]
			self.tableView.reloadData()
			self.refreshControl.endRefreshing()
			self.index = (self.index + 1) % 2
		}
	}
	
}


extension PullRefreshViewController : UITableViewDataSource,UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.emojiData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)! as UITableViewCell
		cell.textLabel?.text = self.emojiData[indexPath.row]
		return cell
	}
	
	
}

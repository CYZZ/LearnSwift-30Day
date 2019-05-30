//
//  ClearTableViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/30.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class ClearTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

	

	@IBOutlet weak var tableView: UITableView!
	
	var tableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom","哪来这么多数据","我就看看渐变色"]
	
	override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
		self.tableView.separatorStyle = .none
		self.tableView.tableFooterView = UIView(frame: .zero)
		self.tableView.register(ClearTableViewCell.self, forCellReuseIdentifier: "Clearcell")
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Clearcell", for: indexPath) as! ClearTableViewCell
		
		cell.textLabel?.text = tableData[indexPath.row]
		cell.textLabel?.textColor = UIColor.white
		cell.textLabel?.backgroundColor = UIColor.clear
		cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
		cell.selectionStyle = .none
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 70
	}
	
	func colorfroIndex(index: Int) -> UIColor {
		let itemCount = tableData.count - 1
		let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
		return UIColor(red: 1.0, green: 0, blue: color, alpha: 1)
		
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		cell.backgroundColor = colorfroIndex(index: indexPath.row)
	}
	

}

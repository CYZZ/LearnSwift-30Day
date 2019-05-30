//
//  ViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/23.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	static let identifier = "FontCell"
	
	var data = ["00-项目列表",
				"01-SimpleStopWatch",
				"02-CustomFont",
				"03-PlayLocalVideo",
				"04-SnapChatMenu",
				"05-CarouselEffect",
				"06-FindMyLocation",
				"07-PullToRefresh",
				"08-RandomGradientColorMusic",
				"09-ImageScroller",
				"10-VideoBackground",
				"11-ClearTableViewCell",
				"12-LoginAnimation",
				"13-AnimateTableViewCell",
				"14-EmojiSlotMachine",
				"15-AnimatedSplash",
				"16-SlideMenu"]
	

	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier:ViewController.identifier, for: indexPath)
		let text = data[indexPath.row]
		
		cell.textLabel?.text = text
		cell.textLabel?.textColor = UIColor.black
		
		return cell;
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		if indexPath.row == 2 {
			self.navigationController?.pushViewController(CustomFontVC(), animated: true)
		} else if indexPath.row == 3 {
			self.navigationController?.pushViewController(VideoViewController(), animated: true)
		} else if indexPath.row == 4 {
			self.navigationController?.pushViewController(SnapChatViewController(), animated: true)
		}else if indexPath.row == 5 {
			self.navigationController?.pushViewController(CarouselViewController(), animated: true)
		} else if indexPath.row == 6 {
			self.navigationController?.pushViewController(LocationViewController(), animated: true)
		}else if indexPath.row == 7 {
			self.navigationController?.pushViewController(PullRefreshViewController(), animated: true)
		}else if indexPath.row == 8 {
			self.navigationController?.pushViewController(RandomColorViewController(), animated: true)
		} else if indexPath.row == 9 {
			self.navigationController?.pushViewController(ImageScrollViewController(), animated: true)
		} else if indexPath.row == 10 {
			self.navigationController?.pushViewController(SpotifyVideoViewController(), animated: true)
		} else if indexPath.row == 11 {
			self.navigationController?.pushViewController(ClearTableViewController(), animated: true)
		} else if indexPath.row == 12 {
			self.navigationController?.pushViewController(LoginAnimationVC(), animated: true)
		} else if indexPath.row == 13 {
			self.navigationController?.pushViewController(AnimateTableViewController(), animated: true)
		}
		
		print("row = \(self.data[indexPath.row]),hhhh")
	}
}


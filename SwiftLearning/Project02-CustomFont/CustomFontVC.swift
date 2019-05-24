//
//  CustomFontVC.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/23.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class CustomFontVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
	
	var data:[String] = ["01-SimpleStopWatc🙂",
				"02-CustomFont😿🐅🦁🐦🐤🦆",
				"03-PlayLocalVideo",
				"04-SnapChatMenu",
				"05-CarouselEffect",
				"字体-MFTongXin_Noncommercial-Regular",
				"字体-MFJinHei_Noncommercial-Regular",
				"字体-MFZhiHei_Noncommercial-Regular",
				"字体-Zapfino",
				"字体-Gaspar Regular"
				]
	
//	var fontNames = ["MFTongXin_Noncommercial-Regular",
//					 "MFJinHei_Noncommercial-Regular",
//					 "MFZhiHei_Noncommercial-Regular",
//					 "Zapfino",
//					 "Gaspar Regular"]
	
	var fontName = "MFTongXin_Noncommercial-Regular"
	
	
	

	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
		let text = data[indexPath.row]

		cell.textLabel?.text = text
		cell.textLabel?.textColor = UIColor.black
		
		cell.textLabel?.font = UIFont(name: self.fontName, size: 15)
		
		return cell;
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		if data[indexPath.row].hasPrefix("字体") {
			self.fontName = String(data[indexPath.row])
			self.fontName = String(self.fontName.suffix(self.fontName.count - 3))
			print("当前的字体===\(self.fontName)")
			self.tableView.reloadData()
		}
	}

}

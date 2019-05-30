//
//  AnimateTableViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/30.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class AnimateTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
	
	

	@IBOutlet var tableView: UITableView!
	
	var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others", "Personal Life","这是个动画列表", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others", "Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others"]
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = .black
		self.tableView.separatorStyle = .none
		self.tableView.tableFooterView = UIView(frame: .zero)
		self.tableView.register(firstTableViewCell.self , forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.animateTable()
	}
	
	func animateTable() -> Void {
		self.tableView.reloadData()
		let cells = tableView.visibleCells
		let tableHeight: CGFloat = tableView.bounds.height
		
		for ce in cells {
			let cell = ce
			cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
			
		}
		var index = 0
		
		for a in cells {
			let cell = a
			UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
				cell.transform = CGAffineTransform(translationX: 0, y: 0)
			}, completion: nil)
			index += 1
		}
		
	}
	
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.tableData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		cell.textLabel?.text = tableData[indexPath.row]
		cell.textLabel?.textColor = UIColor.white
		cell.textLabel?.backgroundColor = UIColor.clear
		cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
		cell.selectionStyle = .none
		return cell
	}
	
	func colorforIndex(_ index: Int) -> UIColor {
		
		let itemCount = tableData.count - 1
		let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
		return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
		
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		cell.backgroundColor =  colorforIndex(indexPath.row)
	}
	
//	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//
//
//	}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

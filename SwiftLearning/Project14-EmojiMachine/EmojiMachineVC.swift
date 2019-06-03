//
//  EmojiMachineVC.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/31.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class EmojiMachineVC: UIViewController {

	@IBOutlet weak var emojiPickView: UIPickerView!
	@IBOutlet weak var startButton: UIButton!
	@IBOutlet weak var resultLabel: UILabel!
	
	var imageArray = [String]()
	var dataArray1 = [Int]()
	var dataArray2 = [Int]()
	var dataArray3 = [Int]()
	
	var bounds:CGRect = .zero
	
	override func viewDidLoad() {
        super.viewDidLoad()

		bounds = startButton.bounds
		imageArray = ["😈","👻","👩","👽","👮","🎅","🙀","🇨🇳","🐶","🐯"];
		
		for _ in 0...100 {
			self.dataArray1.append(Int(arc4random() % 10))
			self.dataArray2.append(Int(arc4random() % 10))
			self.dataArray3.append(Int(arc4random() % 10))
		}
		
		resultLabel.text = ""
		
		emojiPickView.delegate = self
		emojiPickView.dataSource = self;
		
		startButton.layer.cornerRadius = 6
		startButton.layer.masksToBounds = true
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.startButton.alpha = 0
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
			self.startButton.alpha = 1
		}, completion: nil)
	}

	@IBAction func startButtonClick(_ sender: UIButton) {
		let index1: Int
		let index2: Int
		let index3: Int
		
		index1 = Int(arc4random()) % 90 + 3
		index2 = Int(arc4random()) % 90 + 3
		index3 = Int(arc4random()) % 90 + 3
		
		emojiPickView.selectRow(index1, inComponent: 0, animated: true)
		emojiPickView.selectRow(index2, inComponent: 1, animated: true)
		emojiPickView.selectRow(index3, inComponent: 2, animated: true)
		
		resultLabel.text = "等待抽奖结果"
		
		if dataArray1[emojiPickView.selectedRow(inComponent: 0)] ==
			dataArray2[emojiPickView.selectedRow(inComponent: 1)] &&
			dataArray1[emojiPickView.selectedRow(inComponent: 0)] ==
			dataArray3[emojiPickView.selectedRow(inComponent: 2)]{
			resultLabel.text = "恭喜中了一等奖了"
		} else if dataArray1[emojiPickView.selectedRow(inComponent: 0)] ==
			dataArray2[emojiPickView.selectedRow(inComponent: 1)] ||
			dataArray1[emojiPickView.selectedRow(inComponent: 0)] ==
			dataArray3[emojiPickView.selectedRow(inComponent: 2)] ||
			dataArray2[emojiPickView.selectedRow(inComponent: 1)] ==
			dataArray3[emojiPickView.selectedRow(inComponent: 2)]{
			resultLabel.text = "恭喜中了二等奖了"
		} else {
			resultLabel.text = "💔"
		}
		
		UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
			self.startButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.width - 20, height: self.bounds.height)
		}) { (complete) in
			UIView.animateKeyframes(withDuration: 0.1, delay: 0.0, options:.overrideInheritedOptions, animations: {
				self.startButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.width, height: self.bounds.height)
			}, completion: nil)
		}
		
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

extension EmojiMachineVC: UIPickerViewDelegate, UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 3
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return 100
	}
	
	func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
		return 100.0
	}
	
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 100.0
	}
	
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		let pickLabel = UILabel()
		
		if component == 0 {
			pickLabel.text = imageArray[Int(dataArray1[row])]
		} else if component == 1 {
			pickLabel.text = imageArray[Int(dataArray2[row])]
		} else if component == 2 {
			pickLabel.text = imageArray[Int(dataArray3[row])]
		}
		
		pickLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
		pickLabel.textAlignment = .center
		
		return pickLabel
		
	}
	
	
}

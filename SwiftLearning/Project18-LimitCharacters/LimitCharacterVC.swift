//
//  LimitCharacterVC.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/6/3.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class LimitCharacterVC: UIViewController {

	@IBOutlet weak var chatTextView: UITextView!
	@IBOutlet weak var bottomView: UIView!
	@IBOutlet weak var countLabel: UILabel!
	override func viewDidLoad() {
        super.viewDidLoad()

		chatTextView.delegate = self
		NotificationCenter.default.addObserver(self, selector: #selector(keyBordWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyBordWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
	
	@objc func keyBordWillShow(_ note: NSNotification) {
		let userInfo = note.userInfo
		let keyBoardBounds = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
		let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
		let deltaY = keyBoardBounds.size.height
		let animations = {
			self.bottomView.transform = CGAffineTransform(translationX: 0, y: -deltaY)
		}
		
		if duration > 0 {
			UIView.animate(withDuration: duration, delay: 0, options: [.beginFromCurrentState,.curveLinear], animations: {
				animations()
			}, completion: {
				isComple in
				
			})
		} else {
			animations()
		}
	}
	
	@objc func keyBordWillHide(_ note: NSNotification) {
		let userInfo = note.userInfo
		let duration = (userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
		
		let animations = {
			self.bottomView.transform = .identity
		}
		
		if duration > 0 {
			UIView.animate(withDuration: duration, delay: 0, options: [.beginFromCurrentState,.curveLinear], animations: {
				animations()
			}, completion: nil)
		} else {
			animations()
		}
		
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
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

extension LimitCharacterVC : UITextViewDelegate {
	func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
		let inpuTextLength = text.count - range.length + chatTextView.text.count
		if inpuTextLength > 200 {
			return false
		}
		countLabel.text = "\(200 - inpuTextLength)"
		return true
	}
}

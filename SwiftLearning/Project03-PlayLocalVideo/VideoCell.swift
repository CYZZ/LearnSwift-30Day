//
//  VideoCell.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/23.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

// 定义Video的结构体，属性初始化后不能被改变，因为结构体时值类型。
// 在你每次定义一个新类或者结构体的时候，实际上你是定义了一个新的 Swift 类型。
// 因此请使用UpperCamelCase这种方式来命名
struct Video {
	let image: String
	let title: String
	let source: String
}

class VideoCell: UITableViewCell {

	@IBOutlet weak var videoScreenshot: UIImageView!
	@IBOutlet weak var videoTitleLabel: UILabel!
	@IBOutlet weak var videoDescription: UILabel!
	
//	var myButtonClosuer:(Dictionary) -> Void = {
//		(a:Dictionary) -> Void in
//		print("dic = \(a)")
//	}
	
	var testClosure:() -> Void = {}
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	@IBAction func videoButtonClick(_ sender: UIButton) {
		testClosure()
	}
	
    
}

//
//  ClearTableViewCell.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/30.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class ClearTableViewCell: UITableViewCell {
	
//	let gradientLayer = CAGradientLayer()
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
//		gradientLayer.frame = self.bounds
//		let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor
//		let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor
//		let color3 = UIColor.clear.cgColor
//		let color4 = UIColor(white: 1.0, alpha: 0.05).cgColor
//
//		gradientLayer.colors  = [color1,color2,color3,color4]
//		gradientLayer.locations = [0.0,0.04,0.9,1.0]
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
//		gradientLayer.frame = self.bounds
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

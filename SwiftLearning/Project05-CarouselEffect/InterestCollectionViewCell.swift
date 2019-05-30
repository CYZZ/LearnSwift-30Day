//
//  InterestCollectionViewCell.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/25.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {

	var inter: Interest! {
		didSet {
			updateUI()
		}
	}
	
	@IBOutlet weak var featuredImageView: UIImageView!
	
	@IBOutlet weak var interestTitleLabel: UILabel!
	
	fileprivate func updateUI() {
		interestTitleLabel.text = inter.title
		featuredImageView.image = inter.featuredImage
	}
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		self.layer.cornerRadius = 5.0
		self.clipsToBounds = true
	}
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

//
//  Interest.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/25.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class Interest {

	// MARK: - Public API
	var title = ""
	var description = ""
	var numberOfMembers = 0
	var numberOfPosts = 0
	var featuredImage:UIImage!
	
	init(title:String, description:String, featuredImage:UIImage!) {
		self.title = title
		self.description = description
		self.featuredImage = featuredImage
		numberOfMembers = 1
		numberOfPosts = 1
	}
	
	// MARK: - Private
	
	static func createInterests() -> [Interest] {
		
		return [
			Interest(title: "hello world 111111", description: "11111hhhhfjdkaljfkdlajfkdlas;", featuredImage: UIImage(named: "hello")),
			Interest(title: "hello world 22222", description: "11111hhhhfjdkaljfkdlajfkdlas;", featuredImage: UIImage(named: "dudu")),
			Interest(title: "hello world 33333", description: "11111hhhhfjdkaljfkdlajfkdlas;", featuredImage: UIImage(named: "bodyline")),
			Interest(title: "hello world 44", description: "11111hhhhfjdkaljfkdlajfkdlas;", featuredImage: UIImage(named: "wave")),
			Interest(title: "hello world 555", description: "11111hhhhfjdkaljfkdlajfkdlas;", featuredImage: UIImage(named: "darkvarder")),
			Interest(title: "hello world 666", description: "11111hhhhfjdkaljfkdlajfkdlas;", featuredImage: UIImage(named: "hhhhh"))
		]
	}
	
	
	
	// TODO: - todo
}

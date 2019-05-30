//
//  SpotifyVideoViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/29.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class SpotifyVideoViewController: VideoSplashVC {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.setupVideoBackground()

        // Do any additional setup after loading the view.
    }
	
	func setupVideoBackground() -> Void {
		let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
		
		videoFrame = view.frame
		fillMode = .resizeAspectFill
		alwaysRepeat = true
		sound = true
		starTime = 2.0
		alpha = 0.8
		
		contentURL = url
		
	}

}

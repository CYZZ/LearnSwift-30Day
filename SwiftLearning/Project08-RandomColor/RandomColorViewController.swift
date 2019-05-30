//
//  RandomColorViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/28.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit
import AVFoundation

class RandomColorViewController: UIViewController {
	
	var audioPlayer = AVAudioPlayer()
	
	let gradientLayer = CAGradientLayer()
	
	var timer : Timer?
	
	var backgroundColor:(red:CGFloat, green:CGFloat, blue:CGFloat,alpha:CGFloat)!{
		didSet {
			let color1 = UIColor(red: backgroundColor.blue,
								 green: backgroundColor.green,
								 blue: 0,
								 alpha: backgroundColor.alpha).cgColor
			
			let color2 = UIColor(red: backgroundColor.red,
								 green: backgroundColor.green,
								 blue: 0,
								 alpha: backgroundColor.alpha).cgColor
			
			gradientLayer.colors = [color1,color2]
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.lightGray
        // Do any additional setup after loading the view.
    }
    

	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		print("点击了当前页面")
		
		if timer == nil {
			timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
		}
		
		let redValue = CGFloat(drand48())
		let bluValue = CGFloat(drand48())
		let greenValue = CGFloat(drand48())
		
		self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: bluValue, alpha: 1.0)
		
		gradientLayer.frame = view.frame
		gradientLayer.startPoint = CGPoint(x: 0, y: 0)
		gradientLayer.endPoint = CGPoint(x: 1, y: 1)
		
		self.view.layer.addSublayer(gradientLayer)
		
	}
	
	@objc func randomColor() {
		
		let redValue = CGFloat(drand48())
		let bluValue = CGFloat(drand48())
		let greenValue = CGFloat(drand48())
		
		backgroundColor = (redValue,bluValue,greenValue,1)
	}

}

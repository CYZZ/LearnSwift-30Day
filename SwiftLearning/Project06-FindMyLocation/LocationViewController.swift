//
//  LocationViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/28.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
	@IBOutlet weak var locationLabel: UILabel!
	
	@IBOutlet weak var sendButton: UIButton!
	
	
	// 强制自动解包，可以赋值为nil，为nil后再调用会报错
	// 建议定义为：
	// var locationManager: CLLocationManager
	var locationManager: CLLocationManager!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func sendButtonClick(_ sender: UIButton) {
		
		locationManager = CLLocationManager()
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestAlwaysAuthorization()
		locationManager.startUpdatingLocation()
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

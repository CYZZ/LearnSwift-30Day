//
//  CLocationDelegate.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/28.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

extension LocationViewController : CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		self.locationLabel.text = "获取位置失败。。。。" + error.localizedDescription
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		CLGeocoder().reverseGeocodeLocation(locations.first!) { (placemarks, error) in
			guard error == nil else {
				self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
				return
			}
			if placemarks!.count > 0 {
				let pm = placemarks!.first
				self.displayLocationInfo(pm)
			} else {
				self.locationLabel.text = "解析数据遇到问题了Problem with the data received from geocoder"
			}
		}
		
	}
	
	func displayLocationInfo(_ placemark:CLPlacemark?) -> Void {
		if let containsPlacemark = placemark {
			locationManager.stopUpdatingLocation()
			
			let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
			let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
			let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
			
			let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
			
			
			self.locationLabel.text = postalCode! + " " + locality!
			
			self.locationLabel.text?.append("\n" + administrativeArea! + ", " + country!)
			
		}
	}
}


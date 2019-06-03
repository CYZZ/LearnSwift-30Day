//
//  MenuViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/6/3.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
	
	let transitionManager = MenuTransitionManager()
	

	@IBOutlet weak var textButton: UIButton!
	
	@IBOutlet weak var photoButton: UIButton!
	@IBOutlet weak var quoteButton: UIButton!
	@IBOutlet weak var linkButton: UIButton!
	@IBOutlet weak var chatButton: UIButton!
	@IBOutlet weak var audioButton: UIButton!
	override func viewDidLoad() {
        super.viewDidLoad()

		self.transitioningDelegate = transitionManager
        // Do any additional setup after loading the view.
    }
	@IBAction func textButtonClick(_ sender: UIButton) {
		self.dismiss(animated: true) {
			
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

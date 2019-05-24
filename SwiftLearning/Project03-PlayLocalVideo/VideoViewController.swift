//
//  VideoViewController.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/23.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class VideoViewController: UIViewController {

	
	@IBOutlet weak var videoTableView: UITableView!
	var data = [
		// 给项目编译后属于同一个module，所以Video不需要import就可以使用
		Video(image: "videoScreenshot01",
			  title: "Introduce 3DS Mario",
			  source: "Youtube - 06:32"),
		Video(image: "videoScreenshot02",
			  title: "Emoji Among Us",
			  source: "Vimeo - 3:34"),
		Video(image: "videoScreenshot03",
			  title: "Seals Documentary",
			  source: "Vine - 00:06"),
		Video(image: "videoScreenshot04",
			  title: "Adventure Time",
			  source: "Youtube - 02:39"),
		Video(image: "videoScreenshot05",
			  title: "Facebook HQ",
			  source: "Facebook - 10:20"),
		Video(image: "videoScreenshot06",
			  title: "Lijiang Lugu Lake",
			  source: "Allen - 20:30")
	]
	
	var playerVC = AVPlayerViewController()
	var playerView = AVPlayer()
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
//		videoTableView.register(VideoCell.classForCoder(), forCellReuseIdentifier: "videoCell")
		videoTableView.register(UINib.init(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "videoCellID")
//		videoCellID
        // Do any additional setup after loading the view.
    }

}

//MARK:- UIViewTableView DataSource & Delegate
// 知识点：扩展
// 扩展和 Objective-C 中的分类类似，但没有名称
// 扩展可以为一个类型添加新的功能，但是不能重写已有的功能。
// 扩展可以添加新的计算型属性，但是不可以添加存储型属性，也不可以为已有属性添加属性观察器。
extension VideoViewController:UITableViewDataSource,UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.data.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = videoTableView.dequeueReusableCell(withIdentifier: "videoCellID", for: indexPath) as! VideoCell
		let video = data[indexPath.row]
		
		cell.videoScreenshot.image =  UIImage(named: video.image)
		cell.videoTitleLabel.text = video.title
		cell.videoDescription.text = video.source
		
		cell.testClosure = {
			print("点击了cell上的按钮")
			
			let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
			self.playerView = AVPlayer(url: URL(fileURLWithPath: path!))
			self.playerVC.player = self.playerView
			
			// 知识点：尾随闭包
			// 在使用尾随闭包时，你不用写出它的参数标签
			// 如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉
			// 完整形式如下：
			self.present(self.playerVC, animated: true, completion: {
				self.playerVC.player?.play()
			})
		}
		
		return cell
//		cell.
	}
	
	
}

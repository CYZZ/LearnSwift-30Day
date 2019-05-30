//
//  VideoSplashVC.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/29.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

enum ScalingMode {
	case resize
	case resizeAspect
	case resizeAspectFill
}

class VideoSplashVC: UIViewController {
	
	fileprivate let moviePlayer = AVPlayerViewController()
	fileprivate var moviePlayerSoundLevel : Float = 1.0
	
	var contentURL: URL? {
		didSet {
			if let _contentURL = contentURL {
				setMoviePlayer(_contentURL)
			}
		}
	}
	
	var videoFrame = CGRect()
	var starTime: CGFloat = 0.0
	var duration:CGFloat = 0.0
	var backgroundColor = UIColor.black {
		didSet {
			view.backgroundColor = backgroundColor
		}
	}
	
	var sound = true {
		didSet {
			if sound {
				moviePlayerSoundLevel = 1.0
			} else {
				moviePlayerSoundLevel = 0.0
			}
		}
	}
	
	var alpha: CGFloat = CGFloat() {
		didSet {
			 moviePlayer.view.alpha = alpha
		}
	}
	
	var alwaysRepeat = true {
		didSet {
			if alwaysRepeat {
				NotificationCenter.default.addObserver(self, selector: #selector(self.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: moviePlayer.player?.currentItem)
			}
		}
	}
	
	var fillMode: ScalingMode = .resizeAspectFill {
		didSet {
			switch fillMode {
			case .resize:
				moviePlayer.videoGravity = .resize
			case .resizeAspect:
				moviePlayer.videoGravity = .resizeAspect
			case.resizeAspectFill:
				moviePlayer.videoGravity = .resizeAspectFill
			default: break
				
			}
		}
	}
	
	
	

    override func viewDidLoad() {
        super.viewDidLoad()
		
		
        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		moviePlayer.view.frame = videoFrame
		moviePlayer.showsPlaybackControls = false
		view.addSubview(moviePlayer.view)
		view.sendSubviewToBack(moviePlayer.view)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		NotificationCenter.default.removeObserver(self)
	}
	
	fileprivate func setMoviePlayer(_ url: URL) -> Void {
		
		let videoCutter = VideoCutter()
		videoCutter.cropVideoWIthUrl(videoUrl: url, starTime: starTime, duration: duration) { (videoPath, error) in
			if let path = videoPath as URL? {
				DispatchQueue.main.async {
					self.moviePlayer.player = AVPlayer(url: path)
					self.moviePlayer.player?.play()
					self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
				}
			}
			
		}
	
	}
	
	@objc func playerItemDidReachEnd() -> Void {
		moviePlayer.player?.seek(to: CMTime.zero)
		moviePlayer.player?.play()
	}

}

//
//  CameraVC.swift
//  SwiftLearning
//
//  Created by chiyz on 2019/5/25.
//  Copyright © 2019年 chiyz. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController {

	@IBOutlet weak var cameraView: UIView!
	@IBOutlet weak var tempImageView: UIImageView!
	
	var captureSession : AVCaptureSession?
	var stillImageOutput : AVCaptureStillImageOutput?
	var previewLayer : AVCaptureVideoPreviewLayer?
	
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		previewLayer?.frame = cameraView.bounds
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print("viewWillAppear func = \(self)")
		captureSession = AVCaptureSession()
		
		captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
		let backCamera = AVCaptureDevice.devices(for: .video).first!
		
		var error:NSError?
		var input: AVCaptureDeviceInput!
		
		do {
			input = try AVCaptureDeviceInput(device: backCamera)
		} catch let error1 as NSError {
			error = error1
			input = nil
		}
		
		if (error == nil && captureSession?.canAddInput(input) != nil) {
			captureSession?.addInput(input)
			
			stillImageOutput = AVCaptureStillImageOutput()
			stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
			
			if let stillImageOutputTemp = stillImageOutput {
				if captureSession?.canAddOutput(stillImageOutputTemp) != nil {
					captureSession?.addOutput(stillImageOutputTemp)
					if let captureSessionTemp = captureSession {
						previewLayer = AVCaptureVideoPreviewLayer(session: captureSessionTemp)
						previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
						previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
						cameraView.layer.addSublayer(previewLayer!)
						captureSession?.stopRunning()
					}
				}
			}
		}
		
	}
	
	func didPressTakePhoto() -> Void {
		print("didPressTakePhoto func = \(self)")
		
		if let videoConnection = stillImageOutput?.connection(with: .video) {
			videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
			stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: { (sampleBuffer, error) in
				if sampleBuffer != nil {
					let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer!)
					let dataProvider = CGDataProvider(data: imageData! as CFData)
					let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
					
					let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImage.Orientation.right)
					
					self.tempImageView.image = image
					self.tempImageView.isHighlighted = false
					
				}
			})
		}
	}
	
	var didTakePhoto = Bool()
	
	func didPressTakeAnother() -> Void {
		if didTakePhoto == true {
			tempImageView.isHighlighted = true
			didTakePhoto = false
		} else {
			captureSession?.startRunning()
			didTakePhoto = true
			didPressTakePhoto()
		}
	}
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		didPressTakeAnother()
	}
	
	override var prefersStatusBarHidden: Bool {
		return true;
	}

}

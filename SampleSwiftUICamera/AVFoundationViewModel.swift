//
//  AVFoundationViewModel.swift
//  SampleSwiftUICamera
//
//  Created by 濱田一輝 on 2021/04/17.
//

import Combine
import AVFoundation

final class AVFoundationViewModel: NSObject, ObservableObject {
    
    @Published var previewLayer: AVCaptureVideoPreviewLayer?
    
    let captureSession = AVCaptureSession()
    
    override init() {
        super.init()
        
        setup()
    }
    
    func setup() {
        captureSession.beginConfiguration()
        
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            return
        }
        
        let captureDeviceInput = try! AVCaptureDeviceInput(device: captureDevice)
        captureSession.addInput(captureDeviceInput)
        
        let captureMovieFileOutput = AVCaptureVideoDataOutput()
        captureSession.addOutput(captureMovieFileOutput)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        self.previewLayer = previewLayer
        
        captureSession.commitConfiguration()
    }
    
    func startSession() {
        if captureSession.isRunning {
            return
        }
        
        captureSession.startRunning()
    }
    
    func stopSession() {
        if !captureSession.isRunning {
            return
        }
        
        captureSession.stopRunning()
    }
    
}

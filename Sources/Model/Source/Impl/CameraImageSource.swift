//
//  CameraImageSource.swift
//  ResistAR
//
//  Created by Christopher Hatton on 18/07/2015.
//  Copyright © 2015 AppDelegate. All rights reserved.
//

import Foundation
import CoreImage
import AVFoundation

class CameraImageSource : ImageSource
{
    typealias ImageType = CVPixelBuffer
    
    let session : AVCaptureSession
    let queue   : DispatchQueue
    
    init()
    {
        self.session = AVCaptureSession()
        self.queue   = DispatchQueue( label: "ImageProcessQueue", attributes: [] )
    }
    
    func start( _ handler: @escaping (CVPixelBuffer)->Void )
    {
        session.sessionPreset = AVCaptureSessionPresetMedium
        
        let
            device : AVCaptureDevice          = AVCaptureDevice.defaultDevice( withMediaType: AVMediaTypeVideo ),
            input  : AVCaptureDeviceInput     = try! AVCaptureDeviceInput( device: device ),
            output : AVCaptureVideoDataOutput = AVCaptureVideoDataOutput()
        
        session.addInput(input)
        session.addOutput(output)
        
        class DataOutputDelegate : NSObject, AVCaptureVideoDataOutputSampleBufferDelegate
        {
            let handler : (CVPixelBuffer)->Void
            
            init( handler: @escaping (CVPixelBuffer)->Void )
            {
                self.handler = handler
            }
            
            @objc func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, from connection: AVCaptureConnection!)
            {
                let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)!
                
                //let image : CGImage = CGImageFromCVPixelBuffer( imageBuffer )
                
                self.handler( imageBuffer )
            }
        }
        
        output.setSampleBufferDelegate( DataOutputDelegate( handler: handler ), queue: queue)
        
        output.videoSettings = [ kCVPixelBufferPixelFormatTypeKey as String : Int( kCVPixelFormatType_32BGRA ) ]
        
        session.startRunning()
    }
 
    func stop()
    {
        session.stopRunning()
    }
}

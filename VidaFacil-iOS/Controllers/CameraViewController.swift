//
//  CameraViewController.swift
//  VidaFacil
//
//  Created by Douglas Schiavi on 13/04/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var squareView: DesignableView!
    var video = AVCaptureVideoPreviewLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    func QRReader() {
        self.performSegue(withIdentifier: "Locale-Discount", sender: nil)
    }

    func setupCamera() {
        
        let session = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        } catch {
            print("Camera Error")
        }
        
        let output = AVCaptureMetadataOutput()
        
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: .main)
        output.metadataObjectTypes = [.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubviewToFront(squareView)
        
        session.startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        let data = metadataObjects.first as? AVMetadataMachineReadableCodeObject
        if let object = data {
            if object.type == .qr {
                let alert = UIAlertController(title: "QR" , message: object.stringValue, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { _ in
                    UIPasteboard.general.string = object.stringValue
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}

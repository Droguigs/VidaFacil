//
//  QRViewController.swift
//  VidaFacil-iOS
//
//  Created by Douglas Schiavi on 13/08/19.
//  Copyright © 2019 Douglas Schiavi. All rights reserved.
//

import UIKit
import AVFoundation

class QRViewController: BaseViewController, AVCaptureMetadataOutputObjectsDelegate {

    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var productId: Int = 0
    var qrResult: QRResult?
    
    @IBOutlet weak var QRView: UIView!
    @IBOutlet weak var codeText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.codeText.textColor = .black
        self.codeText.attributedPlaceholder = NSAttributedString(string: "Código",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    }
    
    func setupCamera() {
        
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            failed()
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = QRView.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.position = QRView.center
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            found(code: stringValue)
        }
        
        view.layer.sublayers?.forEach({ (layer) in
            if layer == previewLayer {
                layer.removeFromSuperlayer()
            }
        })
    }
    
    func found(code: String) {
        captureSession.stopRunning()
        codeText.text = code
        useCode(self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func useCode(_ sender: Any) {
        ServicesManager.sharedInstance.api.qr(qrCode: codeText.text, productId: self.productId) { (result, error) in
            if let _error = error {
                self.showError(_error)
            } else if let _result = result {
                self.qrResult = _result
                self.performSegue(withIdentifier: "QR-UserDetails", sender: self)
            }
        }
    }
    
    @IBAction func scanQR(_ sender: Any) {
        setupCamera()
    }
}

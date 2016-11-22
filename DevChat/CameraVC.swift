//
//  CameraVC.swift
//  DevChat
//
//  Created by Richard Cuico on 11/13/16.
//  Copyright © 2016 Richard Cuico. All rights reserved.
//

import UIKit
import FirebaseAuth
import AVFoundation

class CameraVC: AVCamCameraViewController, AAPLCameraVCDelegate {

    @IBOutlet weak var camPreviewView: AVCamPreviewView!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var recordBtn: UIButton!
    
    override func viewDidLoad() {
        
        delegate = self
        self.previewView = camPreviewView
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        performSegue(withIdentifier: "LoginVC", sender: nil)
        
//        guard FIRAuth.auth()?.currentUser != nil else {
//            //if theres a current user we wont run this code
//            performSegue(withIdentifier: "LoginVC", sender: nil)
//            return
//        }
        
    }

    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
        print("Record Btn Pressed")
        // Doesnt work since the view is in Photo mode
        // Works when the delegate = self is off
    }
    
    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()

    }

    
    func shouldEnableCameraUI(_ enable: Bool) {
        cameraBtn.isEnabled = enable
        print("Should enable camera UI: \(enable)")
    }
    
    func shouldEnableRecordUI(_ enable: Bool) {
        recordBtn.isEnabled = enable
        print("Should enable record UI: \(enable)")
    }
    
    func recordingHasStarted() {
        print("Recording has Started")
        // Doesnt work since the view is in Photo mode

    }
    
    func canStartRecording() {
        print("Can Start Recording")
        // Doesnt work since the view is in Photo mode

    }
    
    func videoRecordingFailed() {
        
    }
    
    func videoRecordingComplete(_ videoURL: URL!) {
        performSegue(withIdentifier: "UsersVC", sender: ["videoURL":videoURL])
    }
    
    func snapshotFailed() {
        
    }
    
    func snapshotTaken(_ snapshotData: Data!) {
        performSegue(withIdentifier: "UsersVC", sender: ["snapshotData":snapshotData])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let usersVC = segue.destination as? UsersVC {
            if let videoDict = sender as? Dictionary<String, URL> {
                let url = videoDict["videoURL"]
            }
        }
    }

}


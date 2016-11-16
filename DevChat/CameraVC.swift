//
//  CameraVC.swift
//  DevChat
//
//  Created by Richard Cuico on 11/13/16.
//  Copyright © 2016 Richard Cuico. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: AVCamCameraViewController {

    @IBOutlet weak var camPreviewView: AVCamPreviewView!
    
    override func viewDidLoad() {
        
        self.previewView = camPreviewView
        
        super.viewDidLoad()
    }

  

}


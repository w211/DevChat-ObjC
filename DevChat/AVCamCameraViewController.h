/*
	Copyright (C) 2016 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	View controller for camera interface.
*/

//TESTING Pull
//Pulled current data without earsing this data cool

@import UIKit;
@class AVCamPreviewView;
@protocol AAPLCameraVCDelegate;

@interface AVCamCameraViewController : UIViewController

@property (nonatomic, weak) AVCamPreviewView *previewView;
@property (retain) id <AAPLCameraVCDelegate> delegate;

- (void)changeCamera;
- (void)toggleMovieRecording;



@end

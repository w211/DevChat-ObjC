//
//  AAPLCameraVCDelegate.h
//  DevChat
//
//  Created by Richard Cuico on 11/16/16.
//  Copyright © 2016 Richard Cuico. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import <Foundation/Foundation.h>

@protocol AAPLCameraVCDelegate <NSObject>

//-(void)shouldEnableControls:(BOOL)enable;
-(void)shouldEnableRecordUI:(BOOL)enable;
-(void)shouldEnableCameraUI:(BOOL)enable;
-(void)recordingHasStarted;
-(void)canStartRecording;
-(void)videoRecordingComplete:(NSURL*)videoURL;
-(void)videoRecordingFailed;
-(void)snapshotTaken:(NSData*)snapshotData;
-(void)snapshotFailed;

@end

#endif /* Header_h */

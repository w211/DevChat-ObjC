//
//  AAPLCameraVCDelegate.h
//  DevChat
//
//  Created by Richard Cuico on 11/16/16.
//  Copyright © 2016 Richard Cuico. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AAPLCameraVCDelegate <NSObject>

//-(void)shouldEnableControls:(BOOL)enable;
-(void)shouldEnableRecordUI:(BOOL)enable;
-(void)shouldEnableCameraUI:(BOOL)enable;
-(void)recordingHasStarted;
-(void)canStartRecording;

@end

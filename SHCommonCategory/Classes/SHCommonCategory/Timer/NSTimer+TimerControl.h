//
//  NSTimer+TimerControl.h
//   
//
//  Created by EasonFeng on 7/18/14.
//  Copyright (c) 2014 cn.com.dreamhigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (TimerControl)

- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end

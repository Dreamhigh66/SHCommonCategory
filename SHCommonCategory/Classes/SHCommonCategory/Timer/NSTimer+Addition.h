//
//  NSTimer+Addition.h
//  PagedScrollView
//
//  Created by 陈政 on 14-1-24.
//  Copyright (c) 2014年 Apple Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats callBackBlock:(void (^)())callBackBlock;

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats callBackBlock:(void (^)())callBackBlock;

@end

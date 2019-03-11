//
//  NSTimer+TimerControl.m
//   
//
//  Created by EasonFeng on 7/18/14.
//  Copyright (c) 2014 cn.com.dreamhigh. All rights reserved.
//

#import "NSTimer+TimerControl.h"

@implementation NSTimer (TimerControl)

-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end

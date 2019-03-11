//
//  NSTimer+Addition.m
//  PagedScrollView
//
//  Created by 陈政 on 14-1-24.
//  Copyright (c) 2014年 Apple Inc. All rights reserved.
//

#import "NSTimer+Addition.h"

@implementation NSTimer (Addition)

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

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats callBackBlock:(void (^)())callBackBlock
{
    return [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(timerAction:) userInfo:[callBackBlock copy] repeats:repeats];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)timeInterval repeats:(BOOL)repeats callBackBlock:(void (^)())callBackBlock
{
    return [self timerWithTimeInterval:timeInterval target:self selector:@selector(timerAction:) userInfo:[callBackBlock copy] repeats:repeats];
}

+ (void)timerAction:(NSTimer *)inTimer
{
    if ([inTimer userInfo])
    {
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end











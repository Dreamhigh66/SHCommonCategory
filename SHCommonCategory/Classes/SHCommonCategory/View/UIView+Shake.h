//
//  UIView+Shake.h
//  AFViewShaker
//
//  Created by EasonFeng on 8/15/14.
//  Copyright (c) 2014 okolodev. All rights reserved.
//

#import <UIKit/UIKit.h>


/** Shake
 *
 * @param times The number of shakes
 * @param Offset The offset of position in shaking
 * @param duration The duration of the shake animation
 * @finished
 */


typedef NS_ENUM(NSInteger, ShakeDirection) {
    ShakeDirectionHorizontal = 0,
    ShakeDirectionVertical
};

@interface UIView (Shake)

- (void)shake;

- (void)shakeWithFinishedBlock:(void(^)())finished;

- (void)shakeTimes:(int)times withOffset:(CGFloat)offset duration:(NSTimeInterval)duration shakeDirection:(ShakeDirection)shakeDirection finished:(void (^)())finished;


@end

//
//  UIView+Shake.m
//  AFViewShaker
//
//  Created by EasonFeng on 8/15/14.
//  Copyright (c) 2014 okolodev. All rights reserved.
//

#import "UIView+Shake.h"


static NSTimeInterval const kEFViewShakeDefaultDuration = 0.4;
static NSUInteger const kEFViewShakeDefaultTimes= 6;
static float const kEFViewShakeDefaultOffset = 5.0;
static NSInteger const kEFViewShakeDefaultDerection = ShakeDirectionHorizontal;

@implementation UIView (Shake)

- (void)shake
{
    [self shakeTimes:kEFViewShakeDefaultTimes direction:1 currentTimes:0 offset:kEFViewShakeDefaultOffset duration:kEFViewShakeDefaultDuration shakeDirection:kEFViewShakeDefaultDerection completion:nil];
}

- (void)shakeWithFinishedBlock:(void (^)())finished
{
    [self shakeTimes:kEFViewShakeDefaultTimes direction:1 currentTimes:0 offset:kEFViewShakeDefaultOffset duration:kEFViewShakeDefaultDuration shakeDirection:kEFViewShakeDefaultDerection completion:finished];
}

- (void)shakeTimes:(int)times withOffset:(CGFloat)offset duration:(NSTimeInterval)duration shakeDirection:(ShakeDirection)shakeDirection finished:(void (^)())finished
{
    [self shakeTimes:times direction:1 currentTimes:0 offset:offset duration:duration shakeDirection:shakeDirection completion:finished];
}

- (void)shakeTimes:(int)times direction:(int)direction currentTimes:(int)current offset:(CGFloat)offset duration:(NSTimeInterval)duration shakeDirection:(ShakeDirection)shakeDirection completion:(void (^)())completion
{
    [UIView animateWithDuration:duration/times animations:^{
        self.transform = (shakeDirection == ShakeDirectionHorizontal) ? CGAffineTransformMakeTranslation(offset * direction, 0) : CGAffineTransformMakeTranslation(0, offset * direction);
        
    } completion:^(BOOL finished) {
        if(current >= times) {
			self.transform = CGAffineTransformIdentity;
            if (completion) {
                completion();
            }
			return;
		}
        [self shakeTimes:(times-1)
               direction:direction*-1
            currentTimes:current + 1
                  offset:offset
                duration:(duration - duration/times)
          shakeDirection:shakeDirection
              completion:completion
         ];
    }];
}


@end

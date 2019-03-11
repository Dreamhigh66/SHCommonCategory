//
//  UIViewController+SHSlideUp.h
//   
//
//  Created by Lawrence on 10/9/14.
//  Copyright (c) 2014 cn.com.dreamhigh. All rights reserved.
//

#define kSemiModalAnimationDuration   0.5

#import <UIKit/UIKit.h>

@interface UIViewController (SHSlideUp)

-(void)presentSemiViewController:(UIViewController*)vc;

-(void)presentSemiView:(UIView*)vc;

-(void)dismissSemiModalView;

@end

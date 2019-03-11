//
//  UIViewController+SHColor_navigationBarHidden.m
//   
//
//  Created by Dreamhigh66 on 15/6/8.
//  Copyright (c) 2015年 cn.com.dreamhigh. All rights reserved.
//

#import "UIViewController+SHNavigationBarHidden.h"
#import <objc/runtime.h>

@implementation UIViewController (SHColor_navigationBarHidden)

- (void)setShPreferNavigationBarHidden:(BOOL)shPreferNavigationBarHidden
{
    objc_setAssociatedObject(self, @selector(shPreferNavigationBarHidden), @(shPreferNavigationBarHidden), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)shPreferNavigationBarHidden
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (BOOL)shForbiddenGestureBack
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setShForbiddenGestureBack:(BOOL)shForbiddenGestureBack
{
    objc_setAssociatedObject(self, @selector(shForbiddenGestureBack), @(shForbiddenGestureBack), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

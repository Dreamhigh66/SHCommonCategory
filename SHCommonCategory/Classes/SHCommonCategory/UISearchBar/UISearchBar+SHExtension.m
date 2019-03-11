//
//  UISearchBar+SHExtension.m
//   
//
//  Created by Dreamhigh66 on 15/6/18.
//  Copyright (c) 2015年 cn.com.dreamhigh. All rights reserved.
//

#import "UISearchBar+SHExtension.h"

@implementation UISearchBar (SHExtension)

- (void)removeBackgroundView
{
    [[self searchBarBackgroundViewForView:self] removeFromSuperview];
}

- (UIView *)searchBarBackgroundViewForView:(UIView *)view
{
    __block UIView *backgroundView;
    [view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            backgroundView = obj;
            *stop = YES;
        } else {
            backgroundView = [self searchBarBackgroundViewForView:obj];
        }
    }];
    return backgroundView;
}

@end

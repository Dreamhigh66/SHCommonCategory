//
//  UIView+SHIBnspectable.m
//   
//
//  Created by Dreamhigh66 on 5/12/15.
//  Copyright (c) 2015 cn.com.dreamhigh. All rights reserved.
//

#import "UIView+SHIBnspectable.h"

@implementation UIView (SHIBnspectable)

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}

- (void)setDefaultCornerRadius:(BOOL)defaultCornerRadius
{
    self.cornerRadius = 2;
}

- (BOOL)defaultCornerRadius
{
    return YES;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor
{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setOnePx:(BOOL)onePx
{
    if (onePx)
    {
        CGRect rect = self.frame;
        rect.size.height = 1.0 / [UIScreen mainScreen].scale;
        self.frame = rect;
    }
}

- (BOOL)onePx
{
    return YES;
}

@end






















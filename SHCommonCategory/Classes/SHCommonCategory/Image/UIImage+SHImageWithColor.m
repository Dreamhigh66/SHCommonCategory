//
//  UIImage+SHImageWithColor.m
//   
//
//  Created by Dreamhigh66 on 16/4/21.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import "UIImage+SHImageWithColor.h"

@implementation UIImage (SHImageWithColor)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth radius:(CGFloat)radius {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [[UIScreen mainScreen] scale]);
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    [bezierPath addClip];
    
    [color setFill];
    [bezierPath fill];
    
    if (borderColor) {
        bezierPath.lineWidth = borderWidth;
        [borderColor setStroke];
        [bezierPath stroke];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsPopContext();
    UIGraphicsEndImageContext();
    return image;
}


@end


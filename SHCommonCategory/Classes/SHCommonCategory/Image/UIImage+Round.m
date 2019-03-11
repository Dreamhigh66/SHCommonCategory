//
//  UIImage+Round.m
//   
//
//  Created by Dreamhigh66 on 16/9/29.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import "UIImage+Round.h"

@implementation UIImage (Round)


- (UIImage *)shRoundImage
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextScaleCTM(context, 1, -1);
    CGContextTranslateCTM(context, 0, -rect.size.height);
    
    CGFloat minSize = MIN(self.size.width, self.size.height);
    rect.size.width = minSize;
    rect.size.height = minSize;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:minSize / 2];
    
    [path closePath];
    
    CGContextSaveGState(context);
    [path addClip];
    CGContextDrawImage(context, rect, self.CGImage);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

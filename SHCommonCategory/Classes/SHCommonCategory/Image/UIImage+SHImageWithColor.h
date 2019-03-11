//
//  UIImage+SHImageWithColor.h
//   
//
//  Created by Dreamhigh66 on 16/4/21.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SHImageWithColor)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth radius:(CGFloat)radius;

@end

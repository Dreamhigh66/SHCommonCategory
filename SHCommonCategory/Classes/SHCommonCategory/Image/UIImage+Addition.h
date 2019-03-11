//
// SHColorOrSizeView.h
//   
//
//  Created by Dreamhigh66 on 15-4-13.
//  Copyright (c) 2015年 cn.com.dreamhigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)
+ (UIImage *)resizedImage:(NSString *)imgName;

+ (UIImage *)resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos;

+ (UIImage *)circleImageWithName:(NSString *)name;

+ (UIImage *)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+(UIImage*)imageNamed:(NSString*)imageName transformWidth:(CGFloat)width
                   height:(CGFloat)height;
@end

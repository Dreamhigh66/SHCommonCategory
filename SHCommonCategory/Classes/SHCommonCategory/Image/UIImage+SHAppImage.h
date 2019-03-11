//
//  UIImage+SHSystemImage.h
//   
//
//  Created by Dreamhigh66 on 10/26/15.
//  Copyright © 2015 cn.com.dreamhigh. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Main_Screen_Width  [[UIScreen mainScreen] bounds].size.width

#define Main_Screen_Height [[UIScreen mainScreen] bounds].size.height

@interface UIImage (SHAppImage)

+ (UIImage *)sh_lanuchImage;
+ (UIImage *)sh_appIconImage;

@end

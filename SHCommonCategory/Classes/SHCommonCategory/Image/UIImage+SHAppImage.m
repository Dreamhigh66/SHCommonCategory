//
//  UIImage+SHSystemImage.m
//   
//
//  Created by Dreamhigh66 on 10/26/15.
//  Copyright © 2015 cn.com.dreamhigh. All rights reserved.
//

#import "UIImage+SHAppImage.h"

@implementation UIImage (SHAppImage)

+ (NSString *)splashImageNameForOrientation:(UIDeviceOrientation)orientation
{
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = @"Portrait";
    if (UIDeviceOrientationIsLandscape(orientation))
    {
        viewSize = CGSizeMake(viewSize.height, viewSize.width);
        viewOrientation = @"Landscape";
    }
    NSArray *imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) &&
            [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            return dict[@"UILaunchImageName"];
        }
    }
    return nil;
}

+ (NSString *)sh_iconImageName
{
    NSDictionary *iconInfo = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleIcons"];
    NSDictionary *primaryIcon = iconInfo[@"CFBundlePrimaryIcon"];
    NSArray *iconFiles = primaryIcon[@"CFBundleIconFiles"];
    return iconFiles.count ? iconFiles.lastObject : nil;
}

+ (UIImage *)sh_lanuchImage
{
    return [self sh_lanuchImageForOrientation:UIDeviceOrientationPortrait];
}

+ (UIImage *)sh_lanuchImageForOrientation:(UIDeviceOrientation)orientation
{
    return [UIImage imageNamed:[self splashImageNameForOrientation:orientation]];
}

+ (UIImage *)sh_appIconImage
{
    return [UIImage imageNamed:[self sh_iconImageName]];
}



@end


































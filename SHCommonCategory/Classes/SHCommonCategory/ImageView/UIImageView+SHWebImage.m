//
//  UIImageView+SHWebImage.m
//   
//
//  Created by Dreamhigh66 on 15/12/30.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import "UIImageView+SHWebImage.h"
#import "UIView+WebCacheOperation.h"
#import "NSObject+SHAssociatedObjects.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "UIImage+Round.h"
#import "BFKit.h"
#import "SHSwizzle.h"

static char SHImageCacheOperation;

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

static NSString * const kThumnilKey = @"sh_thumnil";
static NSString * const kRoundImageKey = @"sh_thumnil";
static UIColor *kDefaultPlaceholderColor;

@implementation UIImageView (SHWebImage)

+ (void)load
{
    SHSwizzleMethod([self class], @selector(layoutSubviews), @selector(sh_placeholderLayoutSubviews));
}

- (UIImage *)sh_placeholderImage
{
    return [self associatedValueForKey:_cmd];
}

- (void)sh_placeholderLayoutSubviews
{
    [self sh_placeholderLayoutSubviews];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.placeholderLayer.frame = self.bounds;
    [CATransaction commit];
}

- (UIColor *)placeholderColor {
    UIColor *color = [self associatedValueForKey:_cmd];
    if (!color) {
        color = [UIImageView defaultPlaceholderColor];
    }
    return color;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    [self associateRetainedValue:placeholderColor withKey:@selector(placeholderColor)];
}

+ (UIColor *)defaultPlaceholderColor {
    if (!kDefaultPlaceholderColor) {
        kDefaultPlaceholderColor = [UIColor colorWithHex:0xf3f4f6];
    }
    return kDefaultPlaceholderColor;
}

+ (void)setDefaultPlaceholderColor:(UIColor *)defaultPlaceholderColor {
    kDefaultPlaceholderColor = defaultPlaceholderColor;
}

- (CALayer *)placeholderLayer
{
    CALayer *placeholderLayer = [self associatedValueForKey:_cmd];
    if (!placeholderLayer) {
        placeholderLayer = [[CALayer alloc] init];
        placeholderLayer.backgroundColor = self.placeholderColor.CGColor;
        placeholderLayer.contentsGravity = kCAGravityCenter;
        placeholderLayer.frame = self.bounds;
        placeholderLayer.contentsScale = [UIScreen mainScreen].scale;
        placeholderLayer.masksToBounds = YES;
        [self associateRetainedValue:placeholderLayer withKey:_cmd];
    }
    return placeholderLayer;
}

#pragma mark - public

- (void)sh_setImageWithURL:(NSURL *)URL placeholder:(UIImage *)placeholder
{
    [self sh_setImageWithURL:URL placeholder:placeholder completed:nil];
}

- (void)sh_setImageWithURL:(NSURL *)URL placeholder:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completed
{
    if (self.placeholderLayer.superlayer) {
        [self.placeholderLayer removeFromSuperlayer];
    }
    if (placeholder) {
        [self.layer addSublayer:self.placeholderLayer];
        self.placeholderLayer.contents = (id)placeholder.CGImage;
        [self associateRetainedValue:placeholder withKey:@selector(sh_placeholderImage)];
    }
    WS(weakSelf);
    [self sd_setImageWithURL:URL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            if (weakSelf.placeholderLayer.superlayer) {
                [weakSelf.placeholderLayer removeFromSuperlayer];
            }
        }
        weakSelf.image = image;
        if (completed) {
            completed(image, error, cacheType, imageURL);
        }
        
    }];
}


- (void)cancelOperation
{
    NSOperation *operation = [self associatedValueForKey:&SHImageCacheOperation];
    [operation cancel];
    [self associateRetainedValue:nil withKey:&SHImageCacheOperation];
}

- (void)setOperation:(NSOperation *)operation
{
    [self associateRetainedValue:operation withKey:&SHImageCacheOperation];
}


@end

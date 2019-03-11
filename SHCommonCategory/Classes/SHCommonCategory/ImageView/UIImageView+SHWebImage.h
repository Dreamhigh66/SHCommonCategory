//
//  UIImageView+SHWebImage.h
//   
//
//  Created by Dreamhigh66 on 15/12/30.
//  Copyright © 2015年 cn.com.dreamhigh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"

@interface UIImageView (SHWebImage)

@property (nonatomic, readonly) UIImage *sh_placeholderImage;
@property (nonatomic, readonly) CALayer *placeholderLayer;

// 单独配置 ImageView 占位图的背景色， 设置 placeholderColor 会忽略 defaultPlaceholderColor
@property (nonatomic, strong) UIColor *placeholderColor;

// 全局的占位图背景色
@property (nonatomic, class, strong) UIColor *defaultPlaceholderColor;

- (void)sh_setImageWithURL:(NSURL *)URL placeholder:(UIImage *)placeholder;
- (void)sh_setImageWithURL:(NSURL *)URL placeholder:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completed;

@end

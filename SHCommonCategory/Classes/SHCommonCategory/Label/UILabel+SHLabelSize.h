//
//  UILabel+SHLabelSize.h
//   
//
//  Created by litt1er on 16/12/29.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SHLabelSize)

//获取label的size
+ (CGSize)sizeOfLabelWithCustomMaxWidth:(CGFloat)width systemFontSize:(CGFloat)fontSize andFilledTextString:(NSString *)str;

//获取label的height
+ (CGFloat)heightOfLabelWithCustomMaxWidth:(CGFloat)width systemFontSize:(CGFloat)fontSize andFilledTextString:(NSString *)str;

+ (CGFloat)heightOfLabelWithCustomMaxWidth:(CGFloat)width systemFont:(UIFont *)font attribiueString:(NSAttributedString *)str;
@end

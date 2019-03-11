//
//  UILabel+SHLabelSize.m
//   
//
//  Created by litt1er on 16/12/29.
//  Copyright © 2016年 cn.com.dreamhigh. All rights reserved.
//

#import "UILabel+SHLabelSize.h"

@implementation UILabel (SHLabelSize)

+ (CGFloat)heightOfLabelWithCustomMaxWidth:(CGFloat)width systemFontSize:(CGFloat)fontSize andFilledTextString:(NSString *)str
{
    return [self sizeOfLabelWithCustomMaxWidth:width systemFontSize:fontSize andFilledTextString:str].height;
}

+ (CGSize)sizeOfLabelWithCustomMaxWidth:(CGFloat)width systemFontSize:(CGFloat)fontSize andFilledTextString:(NSString *)str{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = str;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:fontSize];
    [label sizeToFit];
    CGSize size = label.frame.size;
    return size;
}

+ (CGFloat)heightOfLabelWithCustomMaxWidth:(CGFloat)width systemFont:(UIFont *)font attribiueString:(NSAttributedString *)str
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    label.attributedText = str;
    label.numberOfLines = 0;
    label.font = font;
    [label sizeToFit];
    CGSize size = label.frame.size;
    return size.height;
}
@end
